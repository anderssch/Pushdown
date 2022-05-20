definition initial_11_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_11_automaton = {
  ((Init p0, A, Noninit q2))}"
definition initial_11_ctr_loc where "initial_11_ctr_loc = {p0, p1}"
definition initial_11_ctr_loc_st where "initial_11_ctr_loc_st = {q2}"
