definition initial_420_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_420_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_420_ctr_loc where "initial_420_ctr_loc = {}"
definition initial_420_ctr_loc_st where "initial_420_ctr_loc_st = {}"
