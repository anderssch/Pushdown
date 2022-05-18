definition initial_137_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_137_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_137_ctr_loc where "initial_137_ctr_loc = {p0}"
definition initial_137_ctr_loc_st where "initial_137_ctr_loc_st = {q2}"
