definition initial_320_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_320_automaton = {
  ((Initial p1, A, Noninitial q3)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_320_ctr_loc where "initial_320_ctr_loc = {}"
definition initial_320_ctr_loc_st where "initial_320_ctr_loc_st = {q2, q3}"
