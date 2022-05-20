definition initial_240_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_240_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, B, Noninit q3))}"
definition initial_240_ctr_loc where "initial_240_ctr_loc = {}"
definition initial_240_ctr_loc_st where "initial_240_ctr_loc_st = {q2}"
