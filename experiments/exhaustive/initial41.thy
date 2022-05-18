definition initial_41_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_41_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p0, B, Noninitial q2))}"
definition initial_41_ctr_loc where "initial_41_ctr_loc = {p0}"
definition initial_41_ctr_loc_st where "initial_41_ctr_loc_st = {q2}"
