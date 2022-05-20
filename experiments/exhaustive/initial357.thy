definition initial_357_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_357_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_357_ctr_loc where "initial_357_ctr_loc = {p0}"
definition initial_357_ctr_loc_st where "initial_357_ctr_loc_st = {}"
