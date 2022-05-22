definition final_32_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_32_automaton = {
  ((Init p1, B, Noninit q2))}"
definition final_32_ctr_loc where "final_32_ctr_loc = {}"
definition final_32_ctr_loc_st where "final_32_ctr_loc_st = {q2}"
