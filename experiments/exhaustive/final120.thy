definition final_120_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_120_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_120_ctr_loc where "final_120_ctr_loc = {}"
definition final_120_ctr_loc_st where "final_120_ctr_loc_st = {q2}"
