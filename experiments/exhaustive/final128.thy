definition final_128_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_128_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition final_128_ctr_loc where "final_128_ctr_loc = {}"
definition final_128_ctr_loc_st where "final_128_ctr_loc_st = {q2}"
