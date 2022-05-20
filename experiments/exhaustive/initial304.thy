definition initial_304_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_304_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition initial_304_ctr_loc where "initial_304_ctr_loc = {}"
definition initial_304_ctr_loc_st where "initial_304_ctr_loc_st = {q2}"
