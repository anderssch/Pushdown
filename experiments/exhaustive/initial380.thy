definition initial_380_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_380_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_380_ctr_loc where "initial_380_ctr_loc = {}"
definition initial_380_ctr_loc_st where "initial_380_ctr_loc_st = {q3}"
