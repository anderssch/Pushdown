definition initial_264_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_264_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_264_ctr_loc where "initial_264_ctr_loc = {}"
definition initial_264_ctr_loc_st where "initial_264_ctr_loc_st = {q2}"
