definition final_101_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_101_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_101_ctr_loc where "final_101_ctr_loc = {p0}"
definition final_101_ctr_loc_st where "final_101_ctr_loc_st = {}"
