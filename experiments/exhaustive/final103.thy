definition final_103_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_103_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_103_ctr_loc where "final_103_ctr_loc = {p0, p1}"
definition final_103_ctr_loc_st where "final_103_ctr_loc_st = {}"
