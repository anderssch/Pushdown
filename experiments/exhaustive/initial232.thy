definition initial_232_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_232_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Initial p1, A, Noninitial q3))}"
definition initial_232_ctr_loc where "initial_232_ctr_loc = {}"
definition initial_232_ctr_loc_st where "initial_232_ctr_loc_st = {q2, q3}"
