definition initial_375_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_375_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_375_ctr_loc where "initial_375_ctr_loc = {p0, p1}"
definition initial_375_ctr_loc_st where "initial_375_ctr_loc_st = {}"
