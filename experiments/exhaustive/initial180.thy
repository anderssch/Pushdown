definition initial_180_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_180_automaton = {
  ((Initial p0, A, Noninitial q3)),
  ((Initial p0, B, Noninitial q2))}"
definition initial_180_ctr_loc where "initial_180_ctr_loc = {}"
definition initial_180_ctr_loc_st where "initial_180_ctr_loc_st = {q3}"
