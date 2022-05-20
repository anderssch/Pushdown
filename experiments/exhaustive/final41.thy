definition final_41_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_41_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p0, B, Noninit q2))}"
definition final_41_ctr_loc where "final_41_ctr_loc = {p0}"
definition final_41_ctr_loc_st where "final_41_ctr_loc_st = {q2}"
