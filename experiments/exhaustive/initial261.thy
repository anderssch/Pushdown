definition initial_261_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_261_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_261_ctr_loc where "initial_261_ctr_loc = {p0}"
definition initial_261_ctr_loc_st where "initial_261_ctr_loc_st = {}"
