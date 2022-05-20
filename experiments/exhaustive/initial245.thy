definition initial_245_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_245_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, B, Noninit q3))}"
definition initial_245_ctr_loc where "initial_245_ctr_loc = {p0}"
definition initial_245_ctr_loc_st where "initial_245_ctr_loc_st = {q3}"
