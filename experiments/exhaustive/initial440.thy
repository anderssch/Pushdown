definition initial_440_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_440_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_440_ctr_loc where "initial_440_ctr_loc = {}"
definition initial_440_ctr_loc_st where "initial_440_ctr_loc_st = {q2}"
