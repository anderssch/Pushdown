definition initial_339_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_339_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_339_ctr_loc where "initial_339_ctr_loc = {p0, p1}"
definition initial_339_ctr_loc_st where "initial_339_ctr_loc_st = {q2, q3}"
