definition initial_136_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_136_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_136_ctr_loc where "initial_136_ctr_loc = {}"
definition initial_136_ctr_loc_st where "initial_136_ctr_loc_st = {q2}"
