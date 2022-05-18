definition initial_32_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_32_automaton = {
  ((Initial p1, B, Noninitial q2))}"
definition initial_32_ctr_loc where "initial_32_ctr_loc = {}"
definition initial_32_ctr_loc_st where "initial_32_ctr_loc_st = {q2}"
