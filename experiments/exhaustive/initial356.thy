definition initial_356_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_356_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_356_ctr_loc where "initial_356_ctr_loc = {}"
definition initial_356_ctr_loc_st where "initial_356_ctr_loc_st = {}"
