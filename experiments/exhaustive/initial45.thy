definition initial_45_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_45_automaton = {
  ((Initial p0, A, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_45_ctr_loc where "initial_45_ctr_loc = {p0}"
definition initial_45_ctr_loc_st where "initial_45_ctr_loc_st = {}"
