definition final_51_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_51_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, A, Noninit q2))}"
definition final_51_ctr_loc where "final_51_ctr_loc = {p0, p1}"
definition final_51_ctr_loc_st where "final_51_ctr_loc_st = {q2}"
