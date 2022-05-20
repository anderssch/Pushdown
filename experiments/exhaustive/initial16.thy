definition initial_16_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_16_automaton = {
  ((Init p0, B, Noninit q2))}"
definition initial_16_ctr_loc where "initial_16_ctr_loc = {}"
definition initial_16_ctr_loc_st where "initial_16_ctr_loc_st = {q2}"
