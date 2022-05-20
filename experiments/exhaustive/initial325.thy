definition initial_325_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_325_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_325_ctr_loc where "initial_325_ctr_loc = {p0}"
definition initial_325_ctr_loc_st where "initial_325_ctr_loc_st = {}"
