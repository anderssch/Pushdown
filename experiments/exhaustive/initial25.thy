definition initial_25_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_25_automaton = {
  ((Init p1, A, Noninit q2))}"
definition initial_25_ctr_loc where "initial_25_ctr_loc = {p0}"
definition initial_25_ctr_loc_st where "initial_25_ctr_loc_st = {q2}"
