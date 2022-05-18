definition final_64_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_64_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition final_64_ctr_loc where "final_64_ctr_loc = {}"
definition final_64_ctr_loc_st where "final_64_ctr_loc_st = {q2}"
