definition initial_359_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_359_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_359_ctr_loc where "initial_359_ctr_loc = {p0, p1}"
definition initial_359_ctr_loc_st where "initial_359_ctr_loc_st = {}"
