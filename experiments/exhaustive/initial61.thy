definition initial_61_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_61_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_61_ctr_loc where "initial_61_ctr_loc = {p0}"
definition initial_61_ctr_loc_st where "initial_61_ctr_loc_st = {}"
