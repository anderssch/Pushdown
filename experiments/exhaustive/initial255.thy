definition initial_255_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_255_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_255_ctr_loc where "initial_255_ctr_loc = {p0, p1}"
definition initial_255_ctr_loc_st where "initial_255_ctr_loc_st = {}"
