definition initial_364_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_364_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_364_ctr_loc where "initial_364_ctr_loc = {}"
definition initial_364_ctr_loc_st where "initial_364_ctr_loc_st = {q3}"
