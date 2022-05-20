definition initial_312_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_312_automaton = {
  ((Init p1, A, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_312_ctr_loc where "initial_312_ctr_loc = {}"
definition initial_312_ctr_loc_st where "initial_312_ctr_loc_st = {q2}"
