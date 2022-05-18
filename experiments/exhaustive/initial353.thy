definition initial_353_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_353_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_353_ctr_loc where "initial_353_ctr_loc = {p0}"
definition initial_353_ctr_loc_st where "initial_353_ctr_loc_st = {q2}"
