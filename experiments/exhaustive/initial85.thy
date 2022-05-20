definition initial_85_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_85_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition initial_85_ctr_loc where "initial_85_ctr_loc = {p0}"
definition initial_85_ctr_loc_st where "initial_85_ctr_loc_st = {}"
