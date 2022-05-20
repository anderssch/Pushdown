definition initial_341_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_341_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_341_ctr_loc where "initial_341_ctr_loc = {p0}"
definition initial_341_ctr_loc_st where "initial_341_ctr_loc_st = {}"
