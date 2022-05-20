definition initial_298_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_298_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_298_ctr_loc where "initial_298_ctr_loc = {p1}"
definition initial_298_ctr_loc_st where "initial_298_ctr_loc_st = {q2, q3}"
