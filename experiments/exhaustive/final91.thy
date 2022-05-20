definition final_91_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_91_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition final_91_ctr_loc where "final_91_ctr_loc = {p0, p1}"
definition final_91_ctr_loc_st where "final_91_ctr_loc_st = {q2}"
