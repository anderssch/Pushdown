definition initial_449_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_449_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_449_ctr_loc where "initial_449_ctr_loc = {p0}"
definition initial_449_ctr_loc_st where "initial_449_ctr_loc_st = {q2, q3}"
