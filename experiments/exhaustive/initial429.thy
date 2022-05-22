definition initial_429_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_429_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_429_ctr_loc where "initial_429_ctr_loc = {p0}"
definition initial_429_ctr_loc_st where "initial_429_ctr_loc_st = {}"
