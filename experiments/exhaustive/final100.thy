definition final_100_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_100_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_100_ctr_loc where "final_100_ctr_loc = {}"
definition final_100_ctr_loc_st where "final_100_ctr_loc_st = {}"
