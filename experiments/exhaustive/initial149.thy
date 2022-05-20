definition initial_149_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_149_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_149_ctr_loc where "initial_149_ctr_loc = {p0}"
definition initial_149_ctr_loc_st where "initial_149_ctr_loc_st = {q3}"
