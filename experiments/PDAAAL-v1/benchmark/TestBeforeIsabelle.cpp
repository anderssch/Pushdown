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


#include <fstream>
#include <string>
#include <iostream>
#include <filesystem>
#include <boost/program_options.hpp>
#include <pdaaal/Solver.h>
#include <pdaaal/TypedPAutomaton.h>
#include "IsabellePrettyPrinter.h"
#include "../src/pdaaal-bin/parsing/PdaJsonParser.h"

namespace fs = std::filesystem;
namespace po = boost::program_options;
using namespace pdaaal;

template <typename pda_t>
bool solve_pre(const pda_t& pda, PAutomaton<> initial_automaton, PAutomaton<> final_automaton) {
    PAutomatonProduct instance(pda, std::move(initial_automaton), std::move(final_automaton));
    bool answer = Solver::pre_star_accepts(instance);
    return answer;
}
template <typename pda_t>
bool solve_post(const pda_t& pda, PAutomaton<> initial_automaton, PAutomaton<> final_automaton) {
    PAutomatonProduct instance(pda, std::move(initial_automaton), std::move(final_automaton));
    bool answer = Solver::post_star_accepts(instance);
    return answer;
}
template <typename pda_t>
bool solve_dual(const pda_t& pda, PAutomaton<> initial_automaton, PAutomaton<> final_automaton) {
    PAutomatonProduct instance(pda, std::move(initial_automaton), std::move(final_automaton));
    bool answer = Solver::dual_search_accepts(instance);
    return answer;
}

void print_lemmas(bool answer_pre, bool answer_post, bool answer_dual, const std::string& lemma_name,
                  const std::string& pda_name, const std::string& initial_name, const std::string& final_name) {
    std::stringstream lemma_content;
    lemma_content << "  \"check " << pda_name << " " << initial_name << "_automaton " << initial_name << "_ctr_loc " << initial_name << "_ctr_loc_st" << std::endl
                  << "                   " << final_name << "_automaton " << final_name << "_ctr_loc " << final_name << "_ctr_loc_st = Some ";
    if (answer_pre == answer_post) {
        if (answer_pre == answer_dual) {
            std::cout << "lemma " << lemma_name << ":" << std::endl
                      << lemma_content.str() << (answer_pre ? "True" : "False") << "\"" << std::endl
                      << "  by eval" << std::endl;
        } else {
            std::cout << "lemma " << lemma_name << ":" << std::endl
                      << lemma_content.str() << (answer_pre ? "True" : "False") << "\"" << std::endl
                      << "  by eval" << std::endl;
            std::cout << "lemma " << lemma_name << "dual" << ":" << std::endl
                      << lemma_content.str() << (answer_dual ? "True" : "False") << "\"" << std::endl
                      << "  by eval" << std::endl;
        }
    } else {
        if (answer_pre == answer_dual) {
            std::cout << "lemma " << lemma_name << ":" << std::endl
                      << lemma_content.str() << (answer_pre ? "True" : "False") << "\"" << std::endl
                      << "  by eval" << std::endl;
            std::cout << "lemma " << lemma_name << "post" << ":" << std::endl
                      << lemma_content.str() << (answer_post ? "True" : "False") << "\"" << std::endl
                      << "  by eval" << std::endl;
        } else {
            std::cout << "lemma " << lemma_name << ":" << std::endl
                      << lemma_content.str() << (answer_post ? "True" : "False") << "\"" << std::endl
                      << "  by eval" << std::endl;
            std::cout << "lemma " << lemma_name << "pre" << ":" << std::endl
                      << lemma_content.str() << (answer_pre ? "True" : "False") << "\"" << std::endl
                      << "  by eval" << std::endl;
        }
    }
}

template <bool use_state_names>
void run(std::istream& pda_stream, std::istream& initial_stream, std::istream& final_stream, size_t pds_id, size_t initial_id, size_t final_id, bool full, bool setup = false, bool instance = false) {
    std::stringstream dummy;
    auto pda = PdaJSONParser::parse<weight<void>,use_state_names>(pda_stream, dummy);
    auto initial_automaton = PAutomatonJsonParser::parse(initial_stream, pda);
    auto final_automaton = PAutomatonJsonParser::parse(final_stream, pda);

    if (setup) {
        IsabellePrettyPrinter isabelle_pp(std::cout);
        isabelle_pp.print_begin("Test_Setup");
        isabelle_pp.print_sizes(pda.states().size(), pda.number_of_labels(), std::max(initial_automaton.states().size(), final_automaton.states().size()));
        isabelle_pp.print_new_proofs();
        isabelle_pp.print_setup(pda, initial_automaton, final_automaton, "l", true);
        isabelle_pp.print_end();
        return;
    }

    bool answer_pre = solve_pre(pda, initial_automaton, final_automaton);
    bool answer_post = solve_post(pda, initial_automaton, final_automaton);
    bool answer_dual = solve_dual(pda, initial_automaton, final_automaton);

    if (full) {
        IsabellePrettyPrinter isabelle_pp(std::cout);
        isabelle_pp.print_begin();
        isabelle_pp.print_sizes(pda.states().size(), pda.number_of_labels(), std::max(initial_automaton.states().size(), final_automaton.states().size()) - pda.states().size());
        isabelle_pp.print_new_proofs();
        isabelle_pp.print_query(pda, initial_automaton, final_automaton, "l");
        print_lemmas(answer_pre, answer_post, answer_dual, "correctness_check", "pds_rules", "initial", "final");
        isabelle_pp.print_end();
    } else if (instance) {
        IsabellePrettyPrinter isabelle_pp(std::cout);
        isabelle_pp.print_begin("Ex", "PDS.Test_Setup");
        isabelle_pp.print_instance(pda, initial_automaton, final_automaton, "l");
        print_lemmas(answer_pre, answer_post, answer_dual, "correctness_check", "pds_rules", "initial", "final");
        isabelle_pp.print_end();
    } else {
        std::stringstream lemma_name; lemma_name << "p" << pds_id << "i" << initial_id << "f" << final_id;
        std::stringstream pds_name; pds_name << "pds_rules_" << pds_id;
        std::stringstream initial_name; initial_name << "initial_" << initial_id;
        std::stringstream final_name; final_name << "final_" << final_id;
        print_lemmas(answer_pre, answer_post, answer_dual, lemma_name.str(), pds_name.str(), initial_name.str(), final_name.str());
    }
}

int main(int argc, const char** argv) {
    po::options_description opts;
    opts.add_options()
            ("help,h", "produce help message");

    po::options_description input("Input Options");

    size_t pds_id = 0;
    size_t initial_id = 0;
    size_t final_id = 0;
    std::string input_dir;
    bool state_names = false;
    bool output_full_isabelle_file = false;
    bool output_test_setup_isabelle_file = false;
    bool output_instance_isabelle_file = false;
    input.add_options()
            ("pds,p", po::value<size_t>(&pds_id), "Index of pushdown")
            ("initial,i", po::value<size_t>(&initial_id), "Index of initial P-automaton")
            ("final,f", po::value<size_t>(&final_id), "Index of final P-automaton")
            ("dir,d", po::value<std::string>(&input_dir), "Input directory to read files from.")
            ("state-names", po::bool_switch(&state_names), "Enable named states (instead of index).")
            ("full", po::bool_switch(&output_full_isabelle_file), "Output the full Isabelle theory file content.")
            ("setup", po::bool_switch(&output_test_setup_isabelle_file), "Output test setup Isabelle theory file content with ctr_loc, label definitions etc. without pds and automata.")
            ("instance", po::bool_switch(&output_instance_isabelle_file), "Output instance (i.e. pds, automata and lemma) Isabelle theory file that depends on a Test_Setup file.")
            ;
    opts.add(input);

    po::variables_map vm;
    po::store(po::parse_command_line(argc, argv, opts), vm);
    po::notify(vm);

    if (vm.count("help")) {
        std::cout << opts << std::endl;
        return 1;
    }

    if (input_dir.empty()) {
        std::cerr << "Please specify an input directory";
        return 1;
    }
    fs::path input_dir_path(input_dir);
    if (!fs::is_directory(input_dir_path)) {
        std::cerr << "Specified input directory: " << input_dir_path << " is not a valid directory.";
        return 1;
    }

    std::stringstream pda_file_name;
    pda_file_name << "pda" << pds_id << ".json";
    auto pda_file_path = input_dir_path / pda_file_name.str();
    std::stringstream initial_file_name;
    initial_file_name << "initial" << initial_id << ".json";
    auto initial_file_path = input_dir_path / initial_file_name.str();
    std::stringstream final_file_name;
    final_file_name << "final" << final_id << ".json";
    auto final_file_path = input_dir_path / final_file_name.str();

    std::ifstream pda_stream(pda_file_path);
    if (!pda_stream.is_open()) {
        std::stringstream es;
        es << "error: Could not open pda-file: " << pda_file_path << std::endl;
        throw std::runtime_error(es.str());
    }
    std::ifstream initial_stream(initial_file_path);
    if (!initial_stream.is_open()) {
        std::stringstream es;
        es << "error: Could not open file: " << initial_file_path << std::endl;
        throw std::runtime_error(es.str());
    }
    std::ifstream final_stream(final_file_path);
    if (!final_stream.is_open()) {
        std::stringstream es;
        es << "error: Could not open file: " << final_file_path << std::endl;
        throw std::runtime_error(es.str());
    }

    if (state_names) {
        run<true>(pda_stream, initial_stream, final_stream, pds_id, initial_id, final_id, output_full_isabelle_file, output_test_setup_isabelle_file, output_instance_isabelle_file);
    } else {
        run<false>(pda_stream, initial_stream, final_stream, pds_id, initial_id, final_id, output_full_isabelle_file, output_test_setup_isabelle_file, output_instance_isabelle_file);
    }

    return 0;
}
