definition initial_421_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_421_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_421_ctr_loc where "initial_421_ctr_loc = {p0}"
definition initial_421_ctr_loc_st where "initial_421_ctr_loc_st = {}"
