definition initial_164_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_164_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_164_ctr_loc where "initial_164_ctr_loc = {}"
definition initial_164_ctr_loc_st where "initial_164_ctr_loc_st = {q3}"
