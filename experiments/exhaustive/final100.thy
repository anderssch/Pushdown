definition final_100_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_100_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition final_100_ctr_loc where "final_100_ctr_loc = {}"
definition final_100_ctr_loc_st where "final_100_ctr_loc_st = {}"
