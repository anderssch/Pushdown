definition initial_80_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_80_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_80_ctr_loc where "initial_80_ctr_loc = {}"
definition initial_80_ctr_loc_st where "initial_80_ctr_loc_st = {q2}"
