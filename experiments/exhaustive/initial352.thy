definition initial_352_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_352_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_352_ctr_loc where "initial_352_ctr_loc = {}"
definition initial_352_ctr_loc_st where "initial_352_ctr_loc_st = {q2}"
