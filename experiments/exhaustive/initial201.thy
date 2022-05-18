definition initial_201_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_201_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, B, Noninitial q2))}"
definition initial_201_ctr_loc where "initial_201_ctr_loc = {p0}"
definition initial_201_ctr_loc_st where "initial_201_ctr_loc_st = {q2, q3}"
