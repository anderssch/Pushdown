definition initial_344_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_344_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_344_ctr_loc where "initial_344_ctr_loc = {}"
definition initial_344_ctr_loc_st where "initial_344_ctr_loc_st = {q2}"
