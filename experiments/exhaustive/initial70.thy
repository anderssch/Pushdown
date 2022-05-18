definition initial_70_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_70_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_70_ctr_loc where "initial_70_ctr_loc = {p1}"
definition initial_70_ctr_loc_st where "initial_70_ctr_loc_st = {q3}"
