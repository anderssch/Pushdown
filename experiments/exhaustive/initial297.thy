definition initial_297_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_297_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_297_ctr_loc where "initial_297_ctr_loc = {p0}"
definition initial_297_ctr_loc_st where "initial_297_ctr_loc_st = {q2, q3}"
