definition initial_381_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_381_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_381_ctr_loc where "initial_381_ctr_loc = {p0}"
definition initial_381_ctr_loc_st where "initial_381_ctr_loc_st = {q3}"
