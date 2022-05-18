definition initial_205_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_205_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_205_ctr_loc where "initial_205_ctr_loc = {p0}"
definition initial_205_ctr_loc_st where "initial_205_ctr_loc_st = {}"
