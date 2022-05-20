definition initial_280_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_280_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_280_ctr_loc where "initial_280_ctr_loc = {}"
definition initial_280_ctr_loc_st where "initial_280_ctr_loc_st = {q2, q3}"
