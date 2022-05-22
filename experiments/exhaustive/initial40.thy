definition initial_40_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_40_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p0, B, Noninit q2))}"
definition initial_40_ctr_loc where "initial_40_ctr_loc = {}"
definition initial_40_ctr_loc_st where "initial_40_ctr_loc_st = {q2}"
