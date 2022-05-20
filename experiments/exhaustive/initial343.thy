definition initial_343_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_343_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_343_ctr_loc where "initial_343_ctr_loc = {p0, p1}"
definition initial_343_ctr_loc_st where "initial_343_ctr_loc_st = {}"
