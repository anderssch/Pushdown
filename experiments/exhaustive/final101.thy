definition final_101_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_101_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition final_101_ctr_loc where "final_101_ctr_loc = {p0}"
definition final_101_ctr_loc_st where "final_101_ctr_loc_st = {}"
