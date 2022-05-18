definition initial_310_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_310_automaton = {
  ((Initial p1, A, Noninitial q3)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_310_ctr_loc where "initial_310_ctr_loc = {p1}"
definition initial_310_ctr_loc_st where "initial_310_ctr_loc_st = {}"
