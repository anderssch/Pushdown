definition initial_8_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_8_automaton = {
  ((Init p0, A, Noninit q2))}"
definition initial_8_ctr_loc where "initial_8_ctr_loc = {}"
definition initial_8_ctr_loc_st where "initial_8_ctr_loc_st = {q2}"
