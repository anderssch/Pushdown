definition initial_164_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_164_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_164_ctr_loc where "initial_164_ctr_loc = {}"
definition initial_164_ctr_loc_st where "initial_164_ctr_loc_st = {q3}"
