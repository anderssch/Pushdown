definition initial_120_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_120_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q3))}"
definition initial_120_ctr_loc where "initial_120_ctr_loc = {}"
definition initial_120_ctr_loc_st where "initial_120_ctr_loc_st = {q2, q3}"
