definition initial_266_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_266_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_266_ctr_loc where "initial_266_ctr_loc = {p1}"
definition initial_266_ctr_loc_st where "initial_266_ctr_loc_st = {q2}"
