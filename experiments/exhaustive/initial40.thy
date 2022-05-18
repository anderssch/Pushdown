definition initial_40_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_40_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p0, B, Noninitial q2))}"
definition initial_40_ctr_loc where "initial_40_ctr_loc = {}"
definition initial_40_ctr_loc_st where "initial_40_ctr_loc_st = {q2}"
