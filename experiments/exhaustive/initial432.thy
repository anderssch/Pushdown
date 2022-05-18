definition initial_432_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_432_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_432_ctr_loc where "initial_432_ctr_loc = {}"
definition initial_432_ctr_loc_st where "initial_432_ctr_loc_st = {q2}"
