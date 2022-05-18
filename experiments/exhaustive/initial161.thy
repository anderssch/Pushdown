definition initial_161_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_161_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_161_ctr_loc where "initial_161_ctr_loc = {p0}"
definition initial_161_ctr_loc_st where "initial_161_ctr_loc_st = {q2}"
