definition initial_26_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_26_automaton = {
  ((Init p1, A, Noninit q2))}"
definition initial_26_ctr_loc where "initial_26_ctr_loc = {p1}"
definition initial_26_ctr_loc_st where "initial_26_ctr_loc_st = {q2}"
