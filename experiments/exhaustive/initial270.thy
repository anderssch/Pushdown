definition initial_270_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_270_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_270_ctr_loc where "initial_270_ctr_loc = {p1}"
definition initial_270_ctr_loc_st where "initial_270_ctr_loc_st = {}"
