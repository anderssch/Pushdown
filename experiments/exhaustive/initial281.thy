definition initial_281_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_281_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_281_ctr_loc where "initial_281_ctr_loc = {p0}"
definition initial_281_ctr_loc_st where "initial_281_ctr_loc_st = {q2, q3}"
