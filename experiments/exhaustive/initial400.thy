definition initial_400_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_400_automaton = {
  ((Initial p1, A, Noninitial q3)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_400_ctr_loc where "initial_400_ctr_loc = {}"
definition initial_400_ctr_loc_st where "initial_400_ctr_loc_st = {q2, q3}"
