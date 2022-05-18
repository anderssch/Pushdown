definition initial_104_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_104_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, A, Noninitial q3))}"
definition initial_104_ctr_loc where "initial_104_ctr_loc = {}"
definition initial_104_ctr_loc_st where "initial_104_ctr_loc_st = {q2, q3}"
