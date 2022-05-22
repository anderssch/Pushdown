definition initial_449_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_449_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_449_ctr_loc where "initial_449_ctr_loc = {p0}"
definition initial_449_ctr_loc_st where "initial_449_ctr_loc_st = {q2, q3}"
