definition initial_360_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_360_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_360_ctr_loc where "initial_360_ctr_loc = {}"
definition initial_360_ctr_loc_st where "initial_360_ctr_loc_st = {q2}"
