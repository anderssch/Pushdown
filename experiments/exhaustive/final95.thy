definition final_95_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_95_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_95_ctr_loc where "final_95_ctr_loc = {p0, p1}"
definition final_95_ctr_loc_st where "final_95_ctr_loc_st = {}"
