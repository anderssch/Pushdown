definition final_114_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_114_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition final_114_ctr_loc where "final_114_ctr_loc = {p1}"
definition final_114_ctr_loc_st where "final_114_ctr_loc_st = {q2}"
