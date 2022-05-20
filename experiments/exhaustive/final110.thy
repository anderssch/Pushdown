definition final_110_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_110_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition final_110_ctr_loc where "final_110_ctr_loc = {p1}"
definition final_110_ctr_loc_st where "final_110_ctr_loc_st = {}"
