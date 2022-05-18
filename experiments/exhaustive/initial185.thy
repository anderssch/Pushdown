definition initial_185_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_185_automaton = {
  ((Initial p0, A, Noninitial q3)),
  ((Initial p0, B, Noninitial q2))}"
definition initial_185_ctr_loc where "initial_185_ctr_loc = {p0}"
definition initial_185_ctr_loc_st where "initial_185_ctr_loc_st = {q2, q3}"
