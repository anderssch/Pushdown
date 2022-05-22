definition initial_373_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_373_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_373_ctr_loc where "initial_373_ctr_loc = {p0}"
definition initial_373_ctr_loc_st where "initial_373_ctr_loc_st = {}"
