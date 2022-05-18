definition initial_453_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_453_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_453_ctr_loc where "initial_453_ctr_loc = {p0}"
definition initial_453_ctr_loc_st where "initial_453_ctr_loc_st = {}"
