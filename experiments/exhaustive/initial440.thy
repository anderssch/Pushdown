definition initial_440_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_440_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_440_ctr_loc where "initial_440_ctr_loc = {}"
definition initial_440_ctr_loc_st where "initial_440_ctr_loc_st = {q2}"
