definition final_65_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_65_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_65_ctr_loc where "final_65_ctr_loc = {p0}"
definition final_65_ctr_loc_st where "final_65_ctr_loc_st = {q2}"
