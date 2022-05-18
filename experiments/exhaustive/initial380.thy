definition initial_380_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_380_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_380_ctr_loc where "initial_380_ctr_loc = {}"
definition initial_380_ctr_loc_st where "initial_380_ctr_loc_st = {q3}"
