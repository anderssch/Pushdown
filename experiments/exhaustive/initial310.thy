definition initial_310_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_310_automaton = {
  ((Init p1, A, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_310_ctr_loc where "initial_310_ctr_loc = {p1}"
definition initial_310_ctr_loc_st where "initial_310_ctr_loc_st = {}"
