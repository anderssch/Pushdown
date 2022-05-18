definition initial_65_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_65_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_65_ctr_loc where "initial_65_ctr_loc = {p0}"
definition initial_65_ctr_loc_st where "initial_65_ctr_loc_st = {q2}"
