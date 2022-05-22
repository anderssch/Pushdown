definition initial_30_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_30_automaton = {
  ((Init p1, B, Noninit q2))}"
definition initial_30_ctr_loc where "initial_30_ctr_loc = {p1}"
definition initial_30_ctr_loc_st where "initial_30_ctr_loc_st = {}"
