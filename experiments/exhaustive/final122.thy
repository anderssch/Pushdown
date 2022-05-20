definition final_122_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_122_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_122_ctr_loc where "final_122_ctr_loc = {p1}"
definition final_122_ctr_loc_st where "final_122_ctr_loc_st = {q2}"
