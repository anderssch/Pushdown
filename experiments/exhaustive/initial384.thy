definition initial_384_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_384_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_384_ctr_loc where "initial_384_ctr_loc = {}"
definition initial_384_ctr_loc_st where "initial_384_ctr_loc_st = {q2, q3}"
