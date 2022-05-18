definition initial_357_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_357_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_357_ctr_loc where "initial_357_ctr_loc = {p0}"
definition initial_357_ctr_loc_st where "initial_357_ctr_loc_st = {}"
