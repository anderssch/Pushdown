definition initial_110_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_110_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q3))}"
definition initial_110_ctr_loc where "initial_110_ctr_loc = {p1}"
definition initial_110_ctr_loc_st where "initial_110_ctr_loc_st = {}"
