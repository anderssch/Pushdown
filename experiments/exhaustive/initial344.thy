definition initial_344_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_344_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_344_ctr_loc where "initial_344_ctr_loc = {}"
definition initial_344_ctr_loc_st where "initial_344_ctr_loc_st = {q2}"
