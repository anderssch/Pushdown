definition initial_345_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_345_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_345_ctr_loc where "initial_345_ctr_loc = {p0}"
definition initial_345_ctr_loc_st where "initial_345_ctr_loc_st = {q2}"
