definition initial_399_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_399_automaton = {
  ((Init p1, A, Noninit q3)),
  ((Init p1, B, Noninit q2))}"
definition initial_399_ctr_loc where "initial_399_ctr_loc = {p0, p1}"
definition initial_399_ctr_loc_st where "initial_399_ctr_loc_st = {q3}"
