definition initial_300_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_300_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition initial_300_ctr_loc where "initial_300_ctr_loc = {}"
definition initial_300_ctr_loc_st where "initial_300_ctr_loc_st = {}"
