definition initial_412_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_412_automaton = {
  ((Initial p1, B, Noninitial q3)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_412_ctr_loc where "initial_412_ctr_loc = {}"
definition initial_412_ctr_loc_st where "initial_412_ctr_loc_st = {q3}"
