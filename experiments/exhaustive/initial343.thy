definition initial_343_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_343_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_343_ctr_loc where "initial_343_ctr_loc = {p0, p1}"
definition initial_343_ctr_loc_st where "initial_343_ctr_loc_st = {}"
