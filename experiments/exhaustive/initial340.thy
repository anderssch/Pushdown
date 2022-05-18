definition initial_340_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_340_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_340_ctr_loc where "initial_340_ctr_loc = {}"
definition initial_340_ctr_loc_st where "initial_340_ctr_loc_st = {}"
