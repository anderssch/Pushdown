definition initial_332_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_332_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_332_ctr_loc where "initial_332_ctr_loc = {}"
definition initial_332_ctr_loc_st where "initial_332_ctr_loc_st = {q3}"
