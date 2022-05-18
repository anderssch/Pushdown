definition initial_88_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_88_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_88_ctr_loc where "initial_88_ctr_loc = {}"
definition initial_88_ctr_loc_st where "initial_88_ctr_loc_st = {q2}"
