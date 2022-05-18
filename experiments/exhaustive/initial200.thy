definition initial_200_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_200_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, B, Noninitial q2))}"
definition initial_200_ctr_loc where "initial_200_ctr_loc = {}"
definition initial_200_ctr_loc_st where "initial_200_ctr_loc_st = {q2, q3}"
