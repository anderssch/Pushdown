definition initial_105_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_105_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, A, Noninitial q3))}"
definition initial_105_ctr_loc where "initial_105_ctr_loc = {p0}"
definition initial_105_ctr_loc_st where "initial_105_ctr_loc_st = {q2, q3}"
