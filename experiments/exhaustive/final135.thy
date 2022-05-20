definition final_135_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_135_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_135_ctr_loc where "final_135_ctr_loc = {p0, p1}"
definition final_135_ctr_loc_st where "final_135_ctr_loc_st = {}"
