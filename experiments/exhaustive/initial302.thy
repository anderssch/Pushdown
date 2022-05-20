definition initial_302_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_302_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition initial_302_ctr_loc where "initial_302_ctr_loc = {p1}"
definition initial_302_ctr_loc_st where "initial_302_ctr_loc_st = {}"
