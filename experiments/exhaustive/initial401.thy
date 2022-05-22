definition initial_401_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_401_automaton = {
  ((Init p1, A, Noninit q3)),
  ((Init p1, B, Noninit q2))}"
definition initial_401_ctr_loc where "initial_401_ctr_loc = {p0}"
definition initial_401_ctr_loc_st where "initial_401_ctr_loc_st = {q2, q3}"
