definition initial_256_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_256_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_256_ctr_loc where "initial_256_ctr_loc = {}"
definition initial_256_ctr_loc_st where "initial_256_ctr_loc_st = {q2}"
