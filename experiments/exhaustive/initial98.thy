definition initial_98_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_98_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, A, Noninitial q3))}"
definition initial_98_ctr_loc where "initial_98_ctr_loc = {p1}"
definition initial_98_ctr_loc_st where "initial_98_ctr_loc_st = {q2}"
