definition initial_444_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_444_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_444_ctr_loc where "initial_444_ctr_loc = {}"
definition initial_444_ctr_loc_st where "initial_444_ctr_loc_st = {q3}"
