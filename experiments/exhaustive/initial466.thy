definition initial_466_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_466_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_466_ctr_loc where "initial_466_ctr_loc = {p1}"
definition initial_466_ctr_loc_st where "initial_466_ctr_loc_st = {q2, q3}"
