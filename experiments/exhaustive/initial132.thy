definition initial_132_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_132_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_132_ctr_loc where "initial_132_ctr_loc = {}"
definition initial_132_ctr_loc_st where "initial_132_ctr_loc_st = {}"
