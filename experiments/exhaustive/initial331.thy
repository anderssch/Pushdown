definition initial_331_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_331_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_331_ctr_loc where "initial_331_ctr_loc = {p0, p1}"
definition initial_331_ctr_loc_st where "initial_331_ctr_loc_st = {q2}"
