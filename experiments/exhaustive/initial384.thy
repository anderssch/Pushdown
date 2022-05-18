definition initial_384_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_384_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_384_ctr_loc where "initial_384_ctr_loc = {}"
definition initial_384_ctr_loc_st where "initial_384_ctr_loc_st = {q2, q3}"
