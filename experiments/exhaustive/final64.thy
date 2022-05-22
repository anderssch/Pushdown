definition final_64_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_64_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_64_ctr_loc where "final_64_ctr_loc = {}"
definition final_64_ctr_loc_st where "final_64_ctr_loc_st = {q2}"
