definition initial_332_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_332_automaton = {
  ((Initial p1, B, Noninitial q3)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_332_ctr_loc where "initial_332_ctr_loc = {}"
definition initial_332_ctr_loc_st where "initial_332_ctr_loc_st = {q3}"
