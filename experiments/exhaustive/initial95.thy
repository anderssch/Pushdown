definition initial_95_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_95_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, A, Noninitial q3))}"
definition initial_95_ctr_loc where "initial_95_ctr_loc = {p0, p1}"
definition initial_95_ctr_loc_st where "initial_95_ctr_loc_st = {}"
