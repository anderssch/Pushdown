definition final_75_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_75_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_75_ctr_loc where "final_75_ctr_loc = {p0, p1}"
definition final_75_ctr_loc_st where "final_75_ctr_loc_st = {q2}"
