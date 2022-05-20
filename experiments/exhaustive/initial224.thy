definition initial_224_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_224_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, A, Noninit q3))}"
definition initial_224_ctr_loc where "initial_224_ctr_loc = {}"
definition initial_224_ctr_loc_st where "initial_224_ctr_loc_st = {q2}"
