definition initial_100_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_100_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, A, Noninit q3))}"
definition initial_100_ctr_loc where "initial_100_ctr_loc = {}"
definition initial_100_ctr_loc_st where "initial_100_ctr_loc_st = {q3}"
