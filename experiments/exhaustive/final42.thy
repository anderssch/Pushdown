definition final_42_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_42_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p0, B, Noninit q2))}"
definition final_42_ctr_loc where "final_42_ctr_loc = {p1}"
definition final_42_ctr_loc_st where "final_42_ctr_loc_st = {q2}"
