definition final_143_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_143_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_143_ctr_loc where "final_143_ctr_loc = {p0, p1}"
definition final_143_ctr_loc_st where "final_143_ctr_loc_st = {}"
