definition initial_441_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_441_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_441_ctr_loc where "initial_441_ctr_loc = {p0}"
definition initial_441_ctr_loc_st where "initial_441_ctr_loc_st = {q2}"
