definition initial_352_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_352_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_352_ctr_loc where "initial_352_ctr_loc = {}"
definition initial_352_ctr_loc_st where "initial_352_ctr_loc_st = {q2}"
