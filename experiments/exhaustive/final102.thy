definition final_102_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_102_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_102_ctr_loc where "final_102_ctr_loc = {p1}"
definition final_102_ctr_loc_st where "final_102_ctr_loc_st = {}"
