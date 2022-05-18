definition initial_381_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_381_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_381_ctr_loc where "initial_381_ctr_loc = {p0}"
definition initial_381_ctr_loc_st where "initial_381_ctr_loc_st = {q3}"
