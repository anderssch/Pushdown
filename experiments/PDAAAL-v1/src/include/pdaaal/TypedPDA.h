/* 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 *  Copyright Peter G. Jensen
 */

/* 
 * File:   TypedPDA.h
 * Author: Peter G. Jensen <root@petergjoel.dk>
 *
 * Created on July 23, 2019, 1:34 PM
 */

#ifndef TPDA_H
#define TPDA_H

#include <pdaaal/PDA.h>
#include <pdaaal/utils/ptrie_interface.h>

#include <vector>
#include <queue>
#include <unordered_set>
#include <unordered_map>
#include <set>
#include <cassert>
#include <iostream>
#include <sstream>

#include <nlohmann/json.hpp>

namespace pdaaal {

    // Allow conditionally enabling state mapping. (E.g. string -> size_t map vs. just directly use size_t states.)
    template<typename state_t>
    struct state_mapping {
        [[nodiscard]] state_t get_state(size_t id) const {
            assert(id < _state_map.size());
            return _state_map.at(id);
        }
        [[nodiscard]] size_t state_map_size() const {
            return _state_map.size();
        }
    protected:
        utils::ptrie_set<state_t> _state_map;
    };
    struct no_state_mapping {
        [[nodiscard]] size_t get_state(size_t id) const { return id; } // Dummy to match get_state when there is a state mapping.
    };

    template<typename label_t, typename W = weight<void>, fut::type Container = fut::type::vector, typename state_t = size_t, bool skip_state_mapping = std::is_same_v<state_t,size_t>>
    class TypedPDA : public PDA<W, Container>, public std::conditional_t<skip_state_mapping, no_state_mapping, state_mapping<state_t>> {
    public:
        using parent_t = PDA<W, Container>;
    protected:
        using impl_rule_t = typename PDA<W, Container>::rule_t; // This rule type is used internally.
        static_assert(!skip_state_mapping || std::is_same_v<state_t,size_t>, "When skip_state_mapping==true, you must use state_t=size_t");
        using StateMapOrEmpty = std::conditional_t<skip_state_mapping, no_state_mapping, state_mapping<state_t>>;
    private:
        template <typename WT, typename = void> struct rule_t_;
        template <typename WT>
        struct rule_t_<WT, std::enable_if_t<!is_weighted<WT>>> {
            size_t _from = std::numeric_limits<size_t>::max();
            label_t _pre;
            size_t _to = std::numeric_limits<size_t>::max();
            op_t _op = POP;
            label_t _op_label;

            rule_t_() = default;
            rule_t_(size_t from, label_t pre, size_t to, op_t op, label_t op_label)
            : _from(from), _pre(pre), _to(to), _op(op), _op_label(op_label) {};
            rule_t_(const TypedPDA& pda, size_t from, uint32_t pre, details::rule_t<WT> rule)
            : _from(from), _pre(pda.get_symbol(pre)), _to(rule._to), _op(rule._operation),
              _op_label(rule._operation == POP || rule._operation == NOOP ? label_t{} : pda.get_symbol(rule._op_label)) {};
        };
        template <typename WT>
        struct rule_t_<WT, std::enable_if_t<is_weighted<WT>>> {
            size_t _from = std::numeric_limits<size_t>::max();
            label_t _pre;
            size_t _to = std::numeric_limits<size_t>::max();
            op_t _op = POP;
            label_t _op_label;
            typename WT::type _weight;

            rule_t_() = default;
            rule_t_(size_t from, label_t pre, size_t to, op_t op, label_t op_label, typename WT::type weight = WT::zero())
            : _from(from), _pre(pre), _to(to), _op(op), _op_label(op_label), _weight(weight) {};
            rule_t_(const TypedPDA& pda, size_t from, uint32_t pre, details::rule_t<WT> rule)
            : _from(from), _pre(pda.get_symbol(pre)), _to(rule._to), _op(rule._operation),
              _op_label(rule._operation == POP || rule._operation == NOOP ? label_t{} : pda.get_symbol(rule._op_label)),
              _weight(rule._weight) {};
        };
    public:
        using rule_t = rule_t_<W>; // This rule type can be used by users of the library.

    public:
        struct tracestate_t {
            size_t _pdastate = 0;
            std::vector<label_t> _stack;
        };

    public:
        template<fut::type OtherContainer>
        explicit TypedPDA(TypedPDA<label_t,W,OtherContainer,state_t,skip_state_mapping>&& other_pda)
        : parent_t(std::move(static_cast<PDA<W,OtherContainer>&>(other_pda))),
          StateMapOrEmpty(std::move(static_cast<StateMapOrEmpty&>(other_pda))),
          _label_map(other_pda.move_label_map()) {}

        explicit TypedPDA(const std::unordered_set<label_t>& all_labels) {
            std::set<label_t> sorted(all_labels.begin(), all_labels.end());
            for (auto &l : sorted) {
#ifndef NDEBUG
                auto r =
#endif
                _label_map.insert(l);
#ifndef NDEBUG
                assert(r.first);
#endif
            }
        }
        TypedPDA() = default;

        auto move_label_map() { return std::move(_label_map); }

        [[nodiscard]] virtual size_t number_of_labels() const {
            return _label_map.size();
        }

        label_t get_symbol(size_t id) const {
            assert(id < _label_map.size());
            return _label_map.at(id);
        }

        template<typename... Args>
        void add_rules(Args &&... args) {
            add_rules_<W>(std::forward<Args>(args)...);
        }

        void add_rule(const rule_t& r) {
            if constexpr (is_weighted<W>) {
                add_rule(r._from, r._to, r._op, r._op_label, r._pre, r._weight);
            } else {
                add_rule(r._from, r._to, r._op, r._op_label, r._pre);
            }
        }
        void add_wildcard_rule(const rule_t& r) {
            auto lid = find_labelid(r._op, r._op_label);
            if constexpr (is_weighted<W>) {
                this->add_untyped_rule(r._from, r._to, r._op, lid, r._weight, true, std::vector<uint32_t>());
            } else {
                this->add_untyped_rule(r._from, r._to, r._op, lid, true, std::vector<uint32_t>());
            }
        }

        template<typename... Args>
        void add_rule(Args &&... args) {
            add_rule_<W>(std::forward<Args>(args)...);
        }

        std::vector<uint32_t> encode_pre(const std::vector<label_t> &pre) const {
            std::vector<uint32_t> tpre(pre.size());
            for (size_t i = 0; i < pre.size(); ++i) {
                auto &p = pre[i];
                auto res = _label_map.exists(p);
                if (!res.first) {
                    //std::cerr << (int) p.type() << ", " << (int) p.mask() << ", " << (int) p.value() << std::endl;
                    //std::cerr << "SIZE " << _label_map.size() << std::endl;
                    assert(false);
                }
                tpre[i] = res.second;
            }
            return tpre;
        }

        // Enable incremental construction of label (and state) set.
        std::pair<bool,size_t> exists_label(const label_t& label) const {
            return _label_map.exists(label);
        }
        [[nodiscard]] std::pair<bool,size_t> exists_state(const state_t& state) const {
            if constexpr (skip_state_mapping) {
                return std::make_pair(state < this->states().size(), state);
            } else {
                return this->_state_map.exists(state);
            }
        }
        uint32_t insert_label(const label_t& label) {
            return _label_map.insert(label).second;
        }
        size_t insert_state(const state_t& state) {
            size_t id;
            if constexpr (skip_state_mapping) {
                id = state;
            } else {
                id = this->_state_map.insert(state).second;
            }
            this->add_state(id);
            return id;
        }
        void add_rule_detail(size_t from, typename PDA<W>::rule_t r, bool negated, const std::vector<uint32_t>& pre) {
            this->add_untyped_rule_impl(from, r, negated, pre);
        }

        std::vector<rule_t> all_rules() const {
            std::vector<rule_t> result;
            size_t state_i = 0;
            for (const auto& state : this->states()) {
                for (const auto& [rule,labels] : state._rules) {
                    if (labels.wildcard()) {
                        for (uint32_t pre = 0; pre < number_of_labels(); ++pre) {
                            result.emplace_back(*this, state_i, pre, rule);
                        }
                    } else {
                        for (const auto& pre : labels.labels()) {
                            result.emplace_back(*this, state_i, pre, rule);
                        }
                    }
                }
                ++state_i;
            }
            return result;
        }

        std::vector<label_t> get_labels(const labels_t& labels) const { // TODO: Support lazy iteration. Maybe with C++20 ranges..?
            std::vector<label_t> result;
            if (labels.wildcard()) {
                result.reserve(_label_map.size());
                for (size_t i = 0; i < _label_map.size(); ++i) {
                    result.emplace_back(get_symbol(i));
                }
            } else {
                for (auto label : labels.labels()) {
                    result.emplace_back(get_symbol(label));
                }
            }
            return result;
        }
        [[nodiscard]] nlohmann::json to_json() const {
            nlohmann::json j;
            j["pda"] = *this;
            return j;
        }

    protected:
        uint32_t find_labelid(op_t op, label_t label) const {
            if (op != POP && op != NOOP) {
                auto res = _label_map.exists(label);
                if (res.first) {
                    return res.second;
                } else {
                    throw std::logic_error("Couldnt find label during construction");
                }
            }
            return std::numeric_limits<uint32_t>::max();
        }

        void add_rules_impl(size_t from, impl_rule_t rule, bool negated, const std::vector<label_t> &labels, bool negated_pre, const std::vector<label_t> &pre) {
            auto tpre = encode_pre(pre);
            if (negated) {
                size_t last = 0;
                for (auto &l : labels) {
                    auto res = _label_map.exists(l);
                    assert(res.first);
                    for (; last < res.second; ++last) {
                        rule._op_label = last;
                        this->add_untyped_rule_impl(from, rule, negated_pre, tpre);
                    }
                    ++last;
                }
                for (; last < _label_map.size(); ++last) {
                    rule._op_label = last;
                    this->add_untyped_rule_impl(from, rule, negated_pre, tpre);
                }
            } else {
                for (auto &s : labels) {
                    auto lid = find_labelid(rule._operation, s);
                    rule._op_label = lid;
                    this->add_untyped_rule_impl(from, rule, negated_pre, tpre);
                }
            }
        }

    private:
        template<typename WT, typename = std::enable_if_t<!is_weighted<WT>>>
        void add_rules_(size_t from, size_t to, op_t op, bool negated, const std::vector<label_t> &labels, bool negated_pre,
                        const std::vector<label_t> &pre) {
            add_rules_impl(from, {to, op}, negated, labels, negated_pre, pre);
        }

        template<typename WT, typename = std::enable_if_t<is_weighted<WT>>>
        void add_rules_(size_t from, size_t to, op_t op, bool negated, const std::vector<label_t> &labels, bool negated_pre,
                        const std::vector<label_t> &pre, typename WT::type weight = WT::zero()) {
            add_rules_impl(from, {to, op, weight}, negated, labels, negated_pre, pre);
        }

        template<typename WT, typename = std::enable_if_t<!is_weighted<WT>>>
        void add_rule_(size_t from, size_t to, op_t op, label_t label, bool negated, const std::vector<label_t> &pre) {
            auto lid = find_labelid(op, label);
            auto tpre = encode_pre(pre);
            this->add_untyped_rule(from, to, op, lid, negated, tpre);
        }

        template<typename WT, typename = std::enable_if_t<is_weighted<WT>>>
        void add_rule_(size_t from, size_t to, op_t op, label_t label, bool negated, const std::vector<label_t> &pre, typename WT::type weight = WT::zero()) {
            auto lid = find_labelid(op, label);
            auto tpre = encode_pre(pre);
            this->add_untyped_rule(from, to, op, lid, weight, negated, tpre);
        }

        template<typename WT, typename = std::enable_if_t<!is_weighted<WT>>>
        void add_rule_(size_t from, size_t to, op_t op, label_t label, label_t pre) {
            std::vector<label_t> _pre{pre};
            add_rule(from, to, op, label, false, _pre);
        }

        template<typename WT, typename = std::enable_if_t<is_weighted<WT>>>
        void add_rule_(size_t from, size_t to, op_t op, label_t label, label_t pre, typename WT::type weight = WT::zero()) {
            std::vector<label_t> _pre{pre};
            add_rule(from, to, op, label, false, _pre, weight);
        }

        utils::ptrie_set<label_t> _label_map;

    };
    using json = nlohmann::json;
    namespace details {
        template<typename label_t>
        std::string label_to_string(const label_t& label) {
            if constexpr (std::is_same_v<label_t, std::string>) {
                return label;
            } else {
                std::stringstream ss;
                ss << label;
                return ss.str();
            }
        }

        template<typename label_t, typename W, fut::type Container, typename state_t, bool ssm>
        void pda_rule_to_json(json& j_state, json& j_rule, const label_t& pre_label,
                              const typename PDA<W, Container>::rule_t& rule,
                              const TypedPDA<label_t, W, Container, state_t, ssm>& pda) {
            auto label_s = label_to_string(pre_label);
            switch (rule._operation) {
                case POP:
                    j_rule["pop"] = "";
                    break;
                case SWAP:
                    j_rule["swap"] = label_to_string(pda.get_symbol(rule._op_label));
                    break;
                case NOOP:
                    j_rule["swap"] = label_s;
                    break;
                case PUSH:
                    j_rule["push"] = label_to_string(pda.get_symbol(rule._op_label));
                    break;
                default:
                    assert(false);
            }
            if constexpr (W::is_weight) {
                j_rule["weight"] = rule._weight;
            }
            if (j_state.contains(label_s)) {
                if (!j_state[label_s].is_array()) {
                    auto temp_rule = j_state[label_s];
                    j_state[label_s] = json::array();
                    j_state[label_s].emplace_back(temp_rule);
                }
                j_state[label_s].emplace_back(j_rule);
            } else {
                j_state[label_s] = j_rule;
            }
        }
    }
    template<typename label_t, typename W, fut::type Container>
    void to_json(json& j, const TypedPDA<label_t,W,Container,size_t,true>& pda) {
        j = json::object();
        auto j_states = json::array();
        for (const auto& state : pda.states()) {
            auto j_state = json::object();
            for (const auto& [rule, labels] : state._rules) {
                for (const auto label : pda.get_labels(labels)) {
                    auto j_rule = json::object();
                    j_rule["to"] = rule._to;
                    details::pda_rule_to_json(j_state, j_rule, label, rule, pda);
                }
            }
            j_states.emplace_back(j_state);
        }
        j["states"] = j_states;
    }
    template<typename label_t, typename W, fut::type Container, typename state_t>
    void to_json(json& j, const TypedPDA<label_t,W,Container,state_t,false>& pda) {
        j = json::object();
        auto j_states = json::object();
        size_t state_i = 0;
        for (const auto& state : pda.states()) {
            auto j_state = json::object();
            for (const auto& [rule, labels] : state._rules) {
                for (const auto& label : pda.get_labels(labels)) {
                    auto j_rule = json::object();
                    std::stringstream ss;
                    ss << pda.get_state(rule._to);
                    j_rule["to"] = ss.str();
                    details::pda_rule_to_json(j_state, j_rule, label, rule, pda);
                }
            }
            std::stringstream ss;
            ss << pda.get_state(state_i);
            j_states[ss.str()] = j_state;
            ++state_i;
        }
        while (state_i < pda.state_map_size()) {
            std::stringstream ss;
            ss << pda.get_state(state_i);
            j_states[ss.str()] = json::object();
            ++state_i;
        }
        j["states"] = j_states;
    }

}

#endif /* TPDA_H */
