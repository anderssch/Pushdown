definition final_63_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_63_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_63_ctr_loc where "final_63_ctr_loc = {p0, p1}"
definition final_63_ctr_loc_st where "final_63_ctr_loc_st = {}"
