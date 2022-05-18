definition initial_155_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_155_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_155_ctr_loc where "initial_155_ctr_loc = {p0, p1}"
definition initial_155_ctr_loc_st where "initial_155_ctr_loc_st = {q2, q3}"
