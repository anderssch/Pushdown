definition initial_448_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_448_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_448_ctr_loc where "initial_448_ctr_loc = {}"
definition initial_448_ctr_loc_st where "initial_448_ctr_loc_st = {q2, q3}"
