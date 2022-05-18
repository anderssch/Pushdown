definition initial_153_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_153_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_153_ctr_loc where "initial_153_ctr_loc = {p0}"
definition initial_153_ctr_loc_st where "initial_153_ctr_loc_st = {q2, q3}"
