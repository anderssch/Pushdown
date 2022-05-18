definition initial_162_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_162_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_162_ctr_loc where "initial_162_ctr_loc = {p1}"
definition initial_162_ctr_loc_st where "initial_162_ctr_loc_st = {q2}"
