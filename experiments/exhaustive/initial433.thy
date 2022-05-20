definition initial_433_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_433_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_433_ctr_loc where "initial_433_ctr_loc = {p0}"
definition initial_433_ctr_loc_st where "initial_433_ctr_loc_st = {q2}"
