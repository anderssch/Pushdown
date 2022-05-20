definition final_90_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_90_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition final_90_ctr_loc where "final_90_ctr_loc = {p1}"
definition final_90_ctr_loc_st where "final_90_ctr_loc_st = {q2}"
