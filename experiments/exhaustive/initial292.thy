definition initial_292_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_292_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_292_ctr_loc where "initial_292_ctr_loc = {}"
definition initial_292_ctr_loc_st where "initial_292_ctr_loc_st = {q3}"
