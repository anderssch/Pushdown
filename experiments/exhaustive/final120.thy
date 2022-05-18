definition final_120_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_120_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition final_120_ctr_loc where "final_120_ctr_loc = {}"
definition final_120_ctr_loc_st where "final_120_ctr_loc_st = {q2}"
