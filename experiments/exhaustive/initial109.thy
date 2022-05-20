definition initial_109_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_109_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, B, Noninit q3))}"
definition initial_109_ctr_loc where "initial_109_ctr_loc = {p0}"
definition initial_109_ctr_loc_st where "initial_109_ctr_loc_st = {}"
