definition initial_313_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_313_automaton = {
  ((Init p1, A, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_313_ctr_loc where "initial_313_ctr_loc = {p0}"
definition initial_313_ctr_loc_st where "initial_313_ctr_loc_st = {q2}"
