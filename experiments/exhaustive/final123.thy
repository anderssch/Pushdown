definition final_123_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_123_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_123_ctr_loc where "final_123_ctr_loc = {p0, p1}"
definition final_123_ctr_loc_st where "final_123_ctr_loc_st = {q2}"
