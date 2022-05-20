definition initial_88_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_88_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition initial_88_ctr_loc where "initial_88_ctr_loc = {}"
definition initial_88_ctr_loc_st where "initial_88_ctr_loc_st = {q2}"
