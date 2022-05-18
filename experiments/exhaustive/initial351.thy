definition initial_351_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_351_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_351_ctr_loc where "initial_351_ctr_loc = {p0, p1}"
definition initial_351_ctr_loc_st where "initial_351_ctr_loc_st = {}"
