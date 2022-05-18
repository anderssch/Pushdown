definition initial_300_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_300_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_300_ctr_loc where "initial_300_ctr_loc = {}"
definition initial_300_ctr_loc_st where "initial_300_ctr_loc_st = {}"
