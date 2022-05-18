definition initial_67_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_67_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_67_ctr_loc where "initial_67_ctr_loc = {p0, p1}"
definition initial_67_ctr_loc_st where "initial_67_ctr_loc_st = {q2}"
