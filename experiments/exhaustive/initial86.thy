definition initial_86_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_86_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_86_ctr_loc where "initial_86_ctr_loc = {p1}"
definition initial_86_ctr_loc_st where "initial_86_ctr_loc_st = {}"
