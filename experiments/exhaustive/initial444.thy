definition initial_444_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_444_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_444_ctr_loc where "initial_444_ctr_loc = {}"
definition initial_444_ctr_loc_st where "initial_444_ctr_loc_st = {q3}"
