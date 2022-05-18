definition initial_114_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_114_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q3))}"
definition initial_114_ctr_loc where "initial_114_ctr_loc = {p1}"
definition initial_114_ctr_loc_st where "initial_114_ctr_loc_st = {q2}"
