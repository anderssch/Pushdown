definition initial_420_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_420_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_420_ctr_loc where "initial_420_ctr_loc = {}"
definition initial_420_ctr_loc_st where "initial_420_ctr_loc_st = {}"
