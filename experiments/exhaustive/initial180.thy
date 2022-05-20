definition initial_180_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_180_automaton = {
  ((Init p0, A, Noninit q3)),
  ((Init p0, B, Noninit q2))}"
definition initial_180_ctr_loc where "initial_180_ctr_loc = {}"
definition initial_180_ctr_loc_st where "initial_180_ctr_loc_st = {q3}"
