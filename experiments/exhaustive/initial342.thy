definition initial_342_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_342_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_342_ctr_loc where "initial_342_ctr_loc = {p1}"
definition initial_342_ctr_loc_st where "initial_342_ctr_loc_st = {}"
