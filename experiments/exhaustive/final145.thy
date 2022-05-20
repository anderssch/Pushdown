definition final_145_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_145_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_145_ctr_loc where "final_145_ctr_loc = {p0}"
definition final_145_ctr_loc_st where "final_145_ctr_loc_st = {q2}"
