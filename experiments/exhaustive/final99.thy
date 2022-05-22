definition final_99_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_99_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_99_ctr_loc where "final_99_ctr_loc = {p0, p1}"
definition final_99_ctr_loc_st where "final_99_ctr_loc_st = {q2}"
