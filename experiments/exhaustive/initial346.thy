definition initial_346_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_346_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_346_ctr_loc where "initial_346_ctr_loc = {p1}"
definition initial_346_ctr_loc_st where "initial_346_ctr_loc_st = {q2}"
