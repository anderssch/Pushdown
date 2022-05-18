definition initial_360_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_360_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_360_ctr_loc where "initial_360_ctr_loc = {}"
definition initial_360_ctr_loc_st where "initial_360_ctr_loc_st = {q2}"
