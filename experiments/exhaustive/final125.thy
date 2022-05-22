definition final_125_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_125_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_125_ctr_loc where "final_125_ctr_loc = {p0}"
definition final_125_ctr_loc_st where "final_125_ctr_loc_st = {}"
