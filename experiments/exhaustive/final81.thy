definition final_81_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_81_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, A, Noninit q2))}"
definition final_81_ctr_loc where "final_81_ctr_loc = {p0}"
definition final_81_ctr_loc_st where "final_81_ctr_loc_st = {q2}"
