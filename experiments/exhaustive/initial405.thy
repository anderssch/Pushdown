definition initial_405_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_405_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, B, Noninit q2))}"
definition initial_405_ctr_loc where "initial_405_ctr_loc = {p0}"
definition initial_405_ctr_loc_st where "initial_405_ctr_loc_st = {}"
