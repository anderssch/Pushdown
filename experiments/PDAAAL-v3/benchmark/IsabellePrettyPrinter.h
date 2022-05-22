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


#ifndef PDAAAL_ISABELLEPRETTYPRINTER_H
#define PDAAAL_ISABELLEPRETTYPRINTER_H

#include <pdaaal/PAutomaton.h>

class IsabellePrettyPrinter {
private:
    template <typename T, typename Fn = std::function<void(std::ostream&,const T&)>>
    std::ostream& print_list(std::ostream& out, std::vector<T> list, const std::string& separator = "", const std::string& prefix = "", Fn&& print = [](std::ostream& s, const T& t){ s << t; }) {
        static_assert(true);
        bool first = true;
        for (const auto& elem : list) {
            if (first) {
                first = false;
            } else {
                out << separator;
            }
            out << prefix;
            print(out,elem);
        }
        return out;
    }

public:
    explicit IsabellePrettyPrinter(std::ostream& out) : _out(out) { };

    template<typename pda_t>
    void print_setup(const pda_t& pda, const pdaaal::PAutomaton<>& initial_automaton, const pdaaal::PAutomaton<>& final_automaton, const std::string& label_prefix = "", bool more_automaton_states = false) {
        assert(label_prefix.find(' ') == std::string::npos);
        size_t num_states = pda.states().size();
        size_t num_labels = pda.number_of_labels();
        std::vector<size_t> states(num_states);
        std::iota(states.begin(), states.end(), 0);
        std::vector<std::string> labels(num_labels);
        for (size_t label_id = 0; label_id < num_labels; ++label_id) {
            std::stringstream ss; ss << label_prefix << pda.get_symbol(label_id);
            labels[label_id] = ss.str();
        }
        std::vector<size_t> extra_states;
        for (const auto& state : initial_automaton.states()) {
            if (state->_id >= num_states) {
                extra_states.push_back(state->_id);
            }
        }
        for (const auto& state : final_automaton.states()) {
            if (state->_id >= num_states) {
                extra_states.push_back(state->_id);
            }
        }
        // Remove duplicates
        std::sort(extra_states.begin(), extra_states.end());
        extra_states.erase(std::unique(extra_states.begin(), extra_states.end()), extra_states.end());

        size_t i = 0;
        for (const auto& state : states) {
            _out << "lift_definition p" << state <<" :: ctr_loc is "<< i <<" by auto" << std::endl;
            ++i;
        }
        i = 0;
        for (const auto& label : labels) {
            _out << "lift_definition " << label <<" :: label is "<< i <<" by auto" << std::endl;
            ++i;
        }
        if (more_automaton_states) { // Used for setup before delta-debugging.
            states.insert(states.end(), extra_states.begin(), extra_states.end());
            std::swap(states, extra_states);
        }
        i = 0;
        for (const auto& state : extra_states) {
            _out << "lift_definition q" << state <<" :: state is "<< i <<" by auto" << std::endl;
            ++i;
        }
    }


    template<typename pda_t>
    void print_instance(const pda_t& pda, const pdaaal::PAutomaton<>& initial_automaton, const pdaaal::PAutomaton<>& final_automaton, const std::string& label_prefix = "") {
        _out << "(* Define rules of PDS, and the two P-automata *)" << std::endl;
        print_rules("pds_rules", pda, label_prefix);
        print_automaton("initial", initial_automaton, pda, label_prefix);
        print_automaton("final", final_automaton, pda, label_prefix);
        _out << std::endl;
    }

    template<typename pda_t>
    void print_query(const pda_t& pda, const pdaaal::PAutomaton<>& initial_automaton, const pdaaal::PAutomaton<>& final_automaton, const std::string& label_prefix = "") {
        print_setup(pda, initial_automaton, final_automaton, label_prefix);
        _out << std::endl;
        print_instance(pda, initial_automaton, final_automaton, label_prefix);
    }

    void print_begin(const std::string& theory_name = "Ex", const std::string& imports = "PDS.PDS_Code") {
        _out << "theory " << theory_name << std::endl
             << "  imports " << imports << std::endl
             << "begin" << std::endl
             << std::endl;
    }
    void print_sizes(size_t num_pda_states, size_t num_labels, size_t num_extra_states) {
        _out << "abbreviation ctr_locN :: nat where \"ctr_locN \\<equiv> " << std::max(2ul,num_pda_states) << "\"" << std::endl
             << "abbreviation labelN :: nat where \"labelN \\<equiv> " << std::max(2ul,num_labels) << "\"" << std::endl
             << "abbreviation stateN :: nat where \"stateN \\<equiv> " << std::max(2ul,num_extra_states) << "\"" << std::endl;
    }
    void print_new_proofs() {
        _out << R"foo(
typedef ctr_loc = "{0 ..< ctr_locN}" by (auto intro!: exI[of _ 0])
typedef label = "{0 ..< labelN}" by (auto intro!: exI[of _ 0])
typedef state = "{0 ..< stateN}" by (auto intro!: exI[of _ 0])
setup_lifting type_definition_ctr_loc
setup_lifting type_definition_label
setup_lifting type_definition_state

instantiation ctr_loc :: finite begin
instance by (standard, rule finite_surj[of "{0 ..< ctr_locN}" _ Abs_ctr_loc])
  (simp, metis Rep_ctr_loc Rep_ctr_loc_inverse imageI subsetI)
end
instantiation label :: finite begin
instance by (standard, rule finite_surj[of "{0 ..< labelN}" _ Abs_label])
  (simp, metis Rep_label Rep_label_inverse imageI subsetI)
end
instantiation state :: finite begin
instance by (standard, rule finite_surj[of "{0 ..< stateN}" _ Abs_state])
  (simp, metis Rep_state Rep_state_inverse imageI subsetI)
end

lift_definition (code_dt) ctr_loc_list :: "ctr_loc list" is "[0 ..< ctr_locN]" by (auto simp: list.pred_set)
instantiation ctr_loc :: enum begin
definition "enum_ctr_loc = ctr_loc_list"
definition "enum_all_ctr_loc P = list_all P ctr_loc_list"
definition "enum_ex_ctr_loc P = list_ex P ctr_loc_list"
instance by (standard, auto simp: enum_ctr_loc_def enum_all_ctr_loc_def enum_ex_ctr_loc_def
       ctr_loc_list_def image_iff distinct_map inj_on_def Abs_ctr_loc_inject
       list.pred_map list.pred_set list_ex_iff) (metis Abs_ctr_loc_cases)+
end

instantiation ctr_loc :: linorder begin
lift_definition less_ctr_loc :: "ctr_loc \<Rightarrow> ctr_loc \<Rightarrow> bool" is "(<)" .
lift_definition less_eq_ctr_loc :: "ctr_loc \<Rightarrow> ctr_loc \<Rightarrow> bool" is "(\<le>)" .
instance by (standard; transfer) auto
end

instantiation ctr_loc :: equal begin
lift_definition equal_ctr_loc :: "ctr_loc \<Rightarrow> ctr_loc \<Rightarrow> bool" is "(=)" .
instance by (standard; transfer) auto
end

lift_definition (code_dt) label_list :: "label list" is "[0 ..< labelN]" by (auto simp: list.pred_set)
instantiation label :: enum begin
definition "enum_label = label_list"
definition "enum_all_label P = list_all P label_list"
definition "enum_ex_label P = list_ex P label_list"
instance by (standard, auto simp: enum_label_def enum_all_label_def enum_ex_label_def
       label_list_def image_iff distinct_map inj_on_def Abs_label_inject
       list.pred_map list.pred_set list_ex_iff) (metis Abs_label_cases)+
end

instantiation label :: linorder begin
lift_definition less_label :: "label \<Rightarrow> label \<Rightarrow> bool" is "(<)" .
lift_definition less_eq_label :: "label \<Rightarrow> label \<Rightarrow> bool" is "(\<le>)" .
instance by (standard; transfer) auto
end

instantiation label :: equal begin
lift_definition equal_label :: "label \<Rightarrow> label \<Rightarrow> bool" is "(=)" .
instance by (standard; transfer) auto
end

instantiation state :: equal begin
lift_definition equal_state :: "state \<Rightarrow> state \<Rightarrow> bool" is "(=)" .
instance by (standard; transfer) auto
end
)foo";
    }

    void print_proofs() {
        _out << "fun before where" << std::endl
             << "  \"before [] x y = False\"" << std::endl
             << "| \"before (z # zs) x y = (y \\<noteq> z \\<and> (x = z \\<or> before zs x y))\"" << std::endl
             << std::endl
             << R"(lemma before_irrefl: "before xs x x \<Longrightarrow> False")" << std::endl
             << "  by (induct xs) auto" << std::endl
             << "" << std::endl
             << R"(lemma before_trans: "before xs x y \<Longrightarrow> before xs y z \<Longrightarrow> before xs x z")" << std::endl
             << "  by (induct xs) auto" << std::endl
             << std::endl
             << R"(lemma before_asym: "before xs x y \<Longrightarrow> before xs y x \<Longrightarrow> False")" << std::endl
             << "  by (induct xs) auto" << std::endl
             << std::endl
             << R"(lemma before_total_on: "x \<in> set xs \<Longrightarrow> y \<in> set xs \<Longrightarrow> before xs x y \<or> before xs y x \<or> x = y")" << std::endl
             << "  by (induct xs) auto" << std::endl
             << std::endl
             << "instantiation ctr_loc :: finite begin" << std::endl
             << "  instance by (standard, rule finite_subset[of _ \"set ctr_loc_list\"]) (auto intro: ctr_loc.exhaust simp: ctr_loc_list_def)" << std::endl
             << "end" << std::endl
             << "instantiation label :: finite begin" << std::endl
             << "  instance by (standard, rule finite_subset[of _ \"set label_list\"]) (auto intro: label.exhaust simp: label_list_def)" << std::endl
             << "end" << std::endl
             << "instantiation state :: finite begin" << std::endl
             << "  instance by (standard, rule finite_subset[of _ \"set state_list\"]) (auto intro: state.exhaust simp: state_list_def)" << std::endl
             << "end" << std::endl
             << "instantiation ctr_loc :: enum begin" << std::endl
             << "definition \"enum_ctr_loc = ctr_loc_list\"" << std::endl
             << "definition \"enum_all_ctr_loc P = list_all P ctr_loc_list\"" << std::endl
             << "definition \"enum_ex_ctr_loc P = list_ex P ctr_loc_list\"" << std::endl
             << "instance apply standard" << std::endl
             << "     apply (auto simp: enum_ctr_loc_def enum_all_ctr_loc_def enum_ex_ctr_loc_def ctr_loc_list_def)" << std::endl
             << "  subgoal for x by (cases x; simp)" << std::endl
             << "  subgoal for P x by (cases x; simp)" << std::endl
             << "  subgoal for P x by (cases x; simp)" << std::endl
             << "  done" << std::endl
             << "end" << std::endl
             << std::endl
             << "instantiation ctr_loc :: linorder begin" << std::endl
             << R"(definition less_ctr_loc :: "ctr_loc \<Rightarrow> ctr_loc \<Rightarrow> bool" where)" << std::endl
             << "  \"less_ctr_loc = before Enum.enum\"" << std::endl
             << R"(definition less_eq_ctr_loc :: "ctr_loc \<Rightarrow> ctr_loc \<Rightarrow> bool" where)" << std::endl
             << "  \"less_eq_ctr_loc = sup (=) (<)\"" << std::endl
             << "instance" << std::endl
             << "  using before_total_on[of _ \"Enum.enum :: ctr_loc list\"]" << std::endl
             << "  by intro_classes" << std::endl
             << "    (auto simp: less_eq_ctr_loc_def less_ctr_loc_def enum_UNIV" << std::endl
             << "        dest: before_irrefl before_asym intro: before_trans)" << std::endl
             << "end" << std::endl
             << std::endl
             << "lemma set_label_list: \"set label_list = UNIV\"" << std::endl
             << "  apply (auto simp: label_list_def)" << std::endl
             << "  subgoal for x by (cases x; simp)" << std::endl
             << "  done" << std::endl
             << "instantiation label :: linorder begin" << std::endl
             << R"(definition less_label :: "label \<Rightarrow> label \<Rightarrow> bool" where)" << std::endl
             << "  \"less_label = before label_list\"" << std::endl
             << R"(definition less_eq_label :: "label \<Rightarrow> label \<Rightarrow> bool" where)" << std::endl
             << "  \"less_eq_label a b = (a = b \\<or> a < b)\"" << std::endl
             << "instance" << std::endl
             << "  using before_total_on[of _ \"label_list\"]" << std::endl
             << "  by intro_classes" << std::endl
             << "    (auto simp: less_eq_label_def less_label_def set_label_list" << std::endl
             << "        dest: before_irrefl before_asym intro: before_trans)" << std::endl
             << "end" << std::endl;
    }
    void print_lemma(bool answer, const std::string& name = "") {
        _out << "lemma";
        if (!name.empty()) {
            _out << " " << name << ":";
        }
        _out << std::endl
             << "  \"check pds_rules initial_automaton initial_ctr_loc initial_ctr_loc_st" << std::endl
             << "                   final_automaton   final_ctr_loc   final_ctr_loc_st   = Some " << (answer ? "True" : "False") << "\"" << std::endl
             << "  by eval" << std::endl;
    }
    void print_end() {
        _out << std::endl
             << "end" << std::endl;
    }

//protected:
    std::ostream& print_automaton_state(size_t state, const pdaaal::PAutomaton<>& automaton, bool print_type = true) {
        if (state < automaton.pda().states().size()) {
            if (print_type) {
                _out << "Init ";
            }
            _out << "p" << state;
        } else {
            if (print_type) {
                _out << "Noninit ";
            }
            _out << "q" << state;
        }
        return _out;
    }
    template<typename pda_t>
    std::ostream& print_rules(const std::string& name, const pda_t& pda, const std::string& label_prefix = "") {
        auto rules = pda.all_rules();
        _out << "definition " << name << " :: \"(ctr_loc, label) rule set\" where" << std::endl;
        if (rules.empty()) {
            _out << "  \"" << name << " = {}\"" << std::endl;
            return _out;
        }
        _out << "  \"" << name << " = {" << std::endl;
        bool first_rule = true;
        for (const auto& rule : rules) {
            if (first_rule) {
                first_rule = false;
            } else {
                _out << "," << std::endl;
            }
            _out << "  ((p" << rule._from << ", " << label_prefix << rule._pre << "), (p" << rule._to << ", ";
            switch (rule._op) {
                case pdaaal::POP:
                    _out << "pop";
                    break;
                case pdaaal::SWAP:
                    _out << "swap " << label_prefix << rule._op_label;
                    break;
                case pdaaal::NOOP:
                    _out << "swap " << label_prefix << rule._pre;
                    break;
                case pdaaal::PUSH:
                    _out << "push " << label_prefix << rule._op_label << " " << label_prefix << rule._pre;
                    break;
                default:
                    throw std::logic_error("error: Unknown op type.");
                    break;
            }
            _out << "))";
        }
        _out << "}\"" << std::endl;
        return _out;
    }
    template<typename pda_t>
    std::ostream& print_automaton(const std::string& name_prefix, const pdaaal::PAutomaton<>& automaton, const pda_t& pda, const std::string& label_prefix = "") {
        _out << "definition " << name_prefix
             << "_automaton :: \"((ctr_loc, state, label) PDS.state, label) transition set\" where" << std::endl;

        bool first = true;
        std::vector<size_t> accepting_ctr_loc;
        std::vector<size_t> accepting_ctr_loc_st;
        for (const auto& state: automaton.states()) {
            auto from = state->_id;
            if (state->_accepting) {
                if (from < automaton.pda().states().size()) {
                    accepting_ctr_loc.push_back(from);
                } else {
                    accepting_ctr_loc_st.push_back(from);
                }
            }
            for (const auto&[to, labels]: state->_edges) {
                for (const auto& label: labels) {
                    if (first) {
                        first = false;
                        _out << "  \"" << name_prefix << "_automaton = {" << std::endl;
                    } else {
                        _out << "," << std::endl;
                    }
                    _out << "  ((";
                    print_automaton_state(from, automaton) << ", " << label_prefix << pda.get_symbol(label.first) << ", ";
                    print_automaton_state(to, automaton) << "))";
                }
            }
        }
        if (first) {
            _out << "  \"" << name_prefix << "_automaton = {}\"" << std::endl;
        } else {
            _out << "}\"" << std::endl;
        }
        _out << "definition " << name_prefix << "_ctr_loc where \"" << name_prefix << "_ctr_loc = {";
        print_list(_out, accepting_ctr_loc, ", ", "", [&automaton,this](std::ostream& s, size_t state){ print_automaton_state(state, automaton, false); }) << "}\"" << std::endl;
        _out << "definition " << name_prefix << "_ctr_loc_st where \"" << name_prefix << "_ctr_loc_st = {";
        print_list(_out, accepting_ctr_loc_st, ", ", "", [&automaton,this](std::ostream& s, size_t state){ print_automaton_state(state, automaton, false); }) << "}\"" << std::endl;
        return _out;
    }

private:
    std::ostream& _out;
};


#endif //PDAAAL_ISABELLEPRETTYPRINTER_H
