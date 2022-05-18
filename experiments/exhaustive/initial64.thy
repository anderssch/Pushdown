definition initial_64_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_64_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_64_ctr_loc where "initial_64_ctr_loc = {}"
definition initial_64_ctr_loc_st where "initial_64_ctr_loc_st = {q2}"
