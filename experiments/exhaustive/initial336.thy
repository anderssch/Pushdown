definition initial_336_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_336_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_336_ctr_loc where "initial_336_ctr_loc = {}"
definition initial_336_ctr_loc_st where "initial_336_ctr_loc_st = {q2, q3}"
