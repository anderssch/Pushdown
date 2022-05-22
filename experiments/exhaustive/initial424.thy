definition initial_424_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_424_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_424_ctr_loc where "initial_424_ctr_loc = {}"
definition initial_424_ctr_loc_st where "initial_424_ctr_loc_st = {q2}"
