definition initial_252_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_252_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_252_ctr_loc where "initial_252_ctr_loc = {}"
definition initial_252_ctr_loc_st where "initial_252_ctr_loc_st = {}"
