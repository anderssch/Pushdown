definition initial_206_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_206_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_206_ctr_loc where "initial_206_ctr_loc = {p1}"
definition initial_206_ctr_loc_st where "initial_206_ctr_loc_st = {}"
