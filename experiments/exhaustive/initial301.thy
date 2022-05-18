definition initial_301_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_301_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_301_ctr_loc where "initial_301_ctr_loc = {p0}"
definition initial_301_ctr_loc_st where "initial_301_ctr_loc_st = {}"
