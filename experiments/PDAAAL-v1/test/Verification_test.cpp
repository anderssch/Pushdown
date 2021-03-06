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
 *  Copyright Morten K. Schou
 */

/* 
 * File:   Verification_test
 * Author: Morten K. Schou <morten@h-schou.dk>
 *
 * Created on 14-07-2021.
 */

#define BOOST_TEST_MODULE Verification_test

#include <boost/test/unit_test.hpp>

#include <parsing/PAutomatonParser.h>
#include <parsing/PdaJsonParser.h>
#include <pdaaal/SolverInstance.h>
#include <pdaaal/Solver.h>

using namespace pdaaal;

template<typename pda_t>
void print_trace(const std::vector<typename pda_t::tracestate_t>& trace, const pda_t& pda, std::ostream& s = std::cout) {
    for (const auto& trace_state : trace) {
        s << "< " << pda.get_state(trace_state._pdastate) << ", [";
        bool first = true;
        for (const auto& label : trace_state._stack) {
            if (first) {
                first = false;
            } else {
                s << ", ";
            }
            s << label;
        }
        s << "] >" << std::endl;
    }
}
template<typename Automaton, typename pda_t>
void print_automaton(const Automaton& automaton, const pda_t& pda, std::ostream& s = std::cout) {
    automaton.to_dot(s,
        [&pda](std::ostream& s, const uint32_t& label){ s << pda.get_symbol(label); },
        [&pda](std::ostream& s, const size_t& state_id){
            if (state_id < pda.states().size()) {
                s << pda.get_state(state_id);
            } else {
                s << state_id;
            }
        }
    );
}
template<typename label_t, typename state_t, typename W, bool ssm, bool indirect>
auto get_edge(const PAutomaton<W,indirect>& automaton, const TypedPDA<label_t,W,fut::type::vector,state_t,ssm>& pda, const state_t& from, const label_t& label, const state_t& to) {
    BOOST_TEST(pda.exists_state(from).first);
    auto from_id = pda.exists_state(from).second;
    BOOST_TEST(pda.exists_label(label).first);
    auto label_id = pda.exists_label(label).second;
    BOOST_TEST(pda.exists_state(to).first);
    auto to_id = pda.exists_state(to).second;
    return automaton.states()[from_id]->_edges.get(to_id, label_id);
}

BOOST_AUTO_TEST_CASE(Verification_Test_1)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "Zero": { "A": {"to": "Two", "swap": "B", "weight": 2} },
          "One": { "B": {"to": "Two", "push": "B", "weight": 1} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<uint32_t>,true>(pda_stream, std::cerr);
    auto initial_p_automaton = PAutomatonParser::parse_string("< [Zero, One] , ([A]?[B])* >", pda);
    auto final_p_automaton = PAutomatonParser::parse_string("< [Two] , [B] [B] [B] >", pda);
    PAutomatonProduct instance(pda, std::move(initial_p_automaton), std::move(final_p_automaton));

    bool result = Solver::post_star_accepts<Trace_Type::Shortest>(instance);

    BOOST_TEST(result);

    auto [trace, weight] = Solver::get_trace<Trace_Type::Shortest>(instance);

    BOOST_CHECK_EQUAL(weight, 1);
    BOOST_CHECK_EQUAL(trace.size(), 2);

    std::cout << "Weight: " << weight << std::endl;
    print_trace(trace, pda);
}

BOOST_AUTO_TEST_CASE(Verification_negative_weight_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p":  { "X":[{"to": "p'", "swap": "Y", "weight": 1},
                       {"to": "q", "swap": "Y", "weight": 1}],
                  "Y": {"to": "p", "pop": "", "weight": 1} },
          "p'": { "Y": {"to": "p", "push": "X", "weight": 0} },
          "q":  { "Y": {"to": "q", "pop": "", "weight": -2} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<int32_t>,true>(pda_stream, std::cerr);
    auto p_automaton = PAutomatonParser::parse_string("< [q] , >", pda);

    Solver::pre_star_fixed_point<Trace_Type::Shortest>(p_automaton);

    std::stringstream s;
    print_automaton(p_automaton, pda, s);
    BOOST_TEST_MESSAGE(s.str());

    auto pXq = get_edge<std::string,std::string>(p_automaton, pda, "p", "X", "q");
    BOOST_CHECK_NE(pXq, nullptr);
    BOOST_CHECK_EQUAL(pXq->second, min_weight<int32_t>::bottom());

    auto pYp = get_edge<std::string,std::string>(p_automaton, pda, "p", "Y", "p");
    BOOST_CHECK_NE(pYp, nullptr);
    BOOST_CHECK_EQUAL(pYp->second, 1);

    auto qYq = get_edge<std::string,std::string>(p_automaton, pda, "q", "Y", "q");
    BOOST_CHECK_NE(qYq, nullptr);
    BOOST_CHECK_EQUAL(qYq->second, -2);
}

BOOST_AUTO_TEST_CASE(Verification_negative_weight_loop_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p":  { "X":{"to": "p", "pop":"", "weight": -1} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<int32_t>,true>(pda_stream, std::cerr);
    auto p_automaton = PAutomatonParser::parse_string("< [p] , >", pda);

    Solver::pre_star_fixed_point<Trace_Type::Shortest>(p_automaton);

    std::stringstream s;
    print_automaton(p_automaton, pda, s);
    BOOST_TEST_MESSAGE(s.str());

    auto pXp = get_edge<std::string,std::string>(p_automaton, pda, "p", "X", "p");
    BOOST_CHECK_NE(pXp, nullptr);
    BOOST_CHECK_EQUAL(pXp->second, -1);
}

BOOST_AUTO_TEST_CASE(Verification_negative_weight_loop_path_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p":  { "X":{"to": "p", "pop":"", "weight": -1} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<int32_t>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [p] , .* >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    Solver::pre_star_fixed_point_accepts<Trace_Type::Shortest>(instance);

    std::stringstream s;
    print_automaton(instance.automaton(), pda, s);
    s << std::endl;
    print_automaton(instance.product_automaton(), pda, s);
    BOOST_TEST_MESSAGE(s.str());

    auto [path, stack, w] = instance.find_path<Trace_Type::ShortestFixedPoint>();
    BOOST_CHECK_EQUAL(w, min_weight<int32_t>::bottom());

    auto [trace, weight] = Solver::get_trace<Trace_Type::ShortestFixedPoint>(instance);
    BOOST_CHECK_EQUAL(w, weight);
}

BOOST_AUTO_TEST_CASE(Verification_negative_weight_loop_path2_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p":  { "X":{"to": "p", "pop":"", "weight": -1} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<int32_t>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [p] , .+ >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    Solver::pre_star_fixed_point_accepts<Trace_Type::Shortest>(instance);

    std::stringstream s;
    print_automaton(instance.automaton(), pda, s);
    s << std::endl;
    print_automaton(instance.product_automaton(), pda, s);
    BOOST_TEST_MESSAGE(s.str());

    auto [path, stack, w] = instance.find_path<Trace_Type::ShortestFixedPoint>();
    BOOST_CHECK_EQUAL(w, min_weight<int32_t>::bottom());

    auto [trace, weight] = Solver::get_trace<Trace_Type::ShortestFixedPoint>(instance);
    BOOST_CHECK_EQUAL(w, weight);
}

BOOST_AUTO_TEST_CASE(Verification_negative_weight_loop_not_accepting_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p":  { "X":{"to": "p", "pop":"", "weight": -1} },
          "q":  { "Y":{"to": "p", "swap":"X", "weight": 1} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<int32_t>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [q] , [Y] .+ >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    Solver::pre_star_fixed_point_accepts<Trace_Type::Shortest>(instance);

    std::stringstream s;
    print_automaton(instance.product_automaton(), pda, s);
    BOOST_TEST_MESSAGE(s.str());

    auto [path, stack, w] = instance.find_path<Trace_Type::ShortestFixedPoint>();
    BOOST_CHECK_EQUAL(w, min_weight<int32_t>::bottom());

    auto [trace, weight] = Solver::get_trace<Trace_Type::ShortestFixedPoint>(instance);
    BOOST_CHECK_EQUAL(w, weight);
}

BOOST_AUTO_TEST_CASE(Verification_negative_weight_finite_path_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "a":  { "X":[{"to": "b", "push":"X", "weight": -1},
                       {"to": "b", "push":"Y", "weight": -4}] },
          "b":  { "X":{"to": "c", "push":"X", "weight": -1},
                  "Y":{"to": "c", "push":"Y", "weight": -1} },
          "c":  { "X":{"to": "c", "pop":"", "weight": -2},
                  "Y":{"to": "c", "pop":"", "weight": -1} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<int32_t>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [a] , [X] >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [c] , >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    Solver::pre_star_fixed_point_accepts<Trace_Type::Shortest>(instance);

    std::stringstream s;
    print_automaton(instance.product_automaton(), pda, s);

    auto [path, stack, w] = instance.find_path<Trace_Type::ShortestFixedPoint>();
    BOOST_CHECK_EQUAL(w, -9);

    auto [trace, weight] = Solver::get_trace<Trace_Type::ShortestFixedPoint>(instance);
    BOOST_CHECK_EQUAL(w, weight);

    BOOST_CHECK_EQUAL(trace.size(), 6);

    s << std::endl;
    print_trace(trace, pda, s);
    BOOST_TEST_MESSAGE(s.str());
}

BOOST_AUTO_TEST_CASE(Verification_poststar_pop_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p": { "X": {"to":"p", "pop":""} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<void>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [p] , [X] [X] >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , [X] >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    auto result = Solver::post_star_accepts(instance);
    BOOST_TEST(result);

    auto trace = Solver::get_trace(instance);
    BOOST_CHECK_EQUAL(trace.size(), 2);
    BOOST_CHECK_EQUAL(trace[0]._stack.size(), 2);
    BOOST_CHECK_EQUAL(trace[1]._stack.size(), 1);

    std::stringstream s;
    print_trace(trace, pda, s);
    BOOST_TEST_MESSAGE(s.str());
}

BOOST_AUTO_TEST_CASE(Verification_poststar_empty_final_stack_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p": { "X": {"to":"p", "pop":""} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<void>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [p] , [X] >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    auto result = Solver::post_star_accepts(instance);
    BOOST_TEST(result);

    auto trace = Solver::get_trace(instance);
    BOOST_CHECK_EQUAL(trace.size(), 2);
    BOOST_CHECK_EQUAL(trace[0]._stack.size(), 1);
    BOOST_CHECK_EQUAL(trace[1]._stack.size(), 0);

    std::stringstream s;
    print_trace(trace, pda, s);
    BOOST_TEST_MESSAGE(s.str());
}

BOOST_AUTO_TEST_CASE(Verification_poststar_no_ET_empty_final_stack_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p": { "X": {"to":"p", "pop":""} }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<void>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [p] , [X] >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    auto result = Solver::post_star_accepts_no_ET(instance);
    BOOST_TEST(result);

    auto trace = Solver::get_trace(instance);
    BOOST_CHECK_EQUAL(trace.size(), 2);
    BOOST_CHECK_EQUAL(trace[0]._stack.size(), 1);
    BOOST_CHECK_EQUAL(trace[1]._stack.size(), 0);

    std::stringstream s;
    print_trace(trace, pda, s);
    BOOST_TEST_MESSAGE(s.str());
}

BOOST_AUTO_TEST_CASE(Verification_negative_ring_push_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p": { "X1":[{"to":"p", "pop":"", "weight": -1},
                       {"to":"q", "swap":"X2", "weight": 0}],
                 "X2": {"to":"q", "swap":"X3", "weight": 0},
                 "X3": {"to":"q", "swap":"Xn", "weight": 0},
                 "Xn": {"to":"q", "swap":"X1", "weight": 0}
               },
          "q": { "X1": {"to":"p", "push":"X1", "weight": 0},
                 "X2": {"to":"p", "push":"X2", "weight": 0},
                 "X3": {"to":"p", "push":"X3", "weight": 0},
                 "Xn": {"to":"p", "push":"Xn", "weight": 0}
               }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<int32_t>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [p] , [X1] >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , [X1] >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    auto result = Solver::pre_star_fixed_point_accepts<Trace_Type::Shortest>(instance);
    BOOST_TEST(result);

    std::stringstream s;
    print_automaton(instance.product_automaton(), pda, s);

    auto [path, stack, w] = instance.find_path<Trace_Type::ShortestFixedPoint>();
    BOOST_CHECK_EQUAL(w, min_weight<int32_t>::bottom());

    auto [trace, weight] = Solver::get_trace<Trace_Type::ShortestFixedPoint>(instance);
    BOOST_CHECK_EQUAL(w, weight);
}

BOOST_AUTO_TEST_CASE(Verification_negative_ring_swap_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p": { "X1":[{"to":"p", "pop":"", "weight": -1},
                       {"to":"p", "push":"X2", "weight": 0}],
                 "X2": {"to":"p", "swap":"X3", "weight": 0},
                 "X3": {"to":"p", "swap":"X4", "weight": 0},
                 "X4": {"to":"p", "swap":"X5", "weight": 0},
                 "X5": {"to":"p", "swap":"Xn", "weight": 0},
                 "Xn": {"to":"p", "swap":"X1", "weight": 0}
               }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<int32_t>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [p] , [X1] >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    auto result = Solver::pre_star_fixed_point_accepts<Trace_Type::Shortest>(instance);
    BOOST_TEST(result);

    std::stringstream s;
    print_automaton(instance.product_automaton(), pda, s);

    auto [path, stack, w] = instance.find_path<Trace_Type::ShortestFixedPoint>();
    BOOST_CHECK_EQUAL(w, min_weight<int32_t>::bottom());

    auto [trace, weight] = Solver::get_trace<Trace_Type::ShortestFixedPoint>(instance);
    BOOST_CHECK_EQUAL(w, weight);
}

BOOST_AUTO_TEST_CASE(Verification_longest_trace_test)
{
    std::istringstream pda_stream(R"({
      "pda": {
        "states": {
          "p": { "X1":[{"to":"p", "pop":"", "weight": 1},
                       {"to":"p", "push":"X2", "weight": 0}],
                 "X2": {"to":"p", "swap":"X3", "weight": 0},
                 "X3": {"to":"p", "swap":"X4", "weight": 0},
                 "X4": {"to":"p", "swap":"X5", "weight": 0},
                 "X5": {"to":"p", "swap":"Xn", "weight": 0},
                 "Xn": {"to":"p", "swap":"X1", "weight": 0}
               }
        }
      }
    })");
    auto pda = PdaJSONParser::parse<weight<uint32_t>,true>(pda_stream, std::cerr);
    auto p_automaton_i = PAutomatonParser::parse_string("< [p] , [X1] >", pda);
    auto p_automaton_f = PAutomatonParser::parse_string("< [p] , >", pda);
    PAutomatonProduct instance(pda, std::move(p_automaton_i), std::move(p_automaton_f));

    auto result = Solver::pre_star_fixed_point_accepts<Trace_Type::Longest>(instance);
    BOOST_TEST(result);

    std::stringstream s;
    print_automaton(instance.product_automaton(), pda, s);

    auto [path, stack, w] = instance.find_path<Trace_Type::Longest>();
    BOOST_CHECK_EQUAL(w, max_weight<uint32_t>::bottom());

    auto [trace, weight] = Solver::get_trace<Trace_Type::Longest>(instance);
    BOOST_CHECK_EQUAL(w, weight);
}
