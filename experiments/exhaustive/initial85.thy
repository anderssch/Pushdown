definition initial_85_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_85_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_85_ctr_loc where "initial_85_ctr_loc = {p0}"
definition initial_85_ctr_loc_st where "initial_85_ctr_loc_st = {}"
