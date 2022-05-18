definition initial_169_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_169_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_169_ctr_loc where "initial_169_ctr_loc = {p0}"
definition initial_169_ctr_loc_st where "initial_169_ctr_loc_st = {q2, q3}"
