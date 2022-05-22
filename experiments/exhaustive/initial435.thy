definition initial_435_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_435_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_435_ctr_loc where "initial_435_ctr_loc = {p0, p1}"
definition initial_435_ctr_loc_st where "initial_435_ctr_loc_st = {q2}"
