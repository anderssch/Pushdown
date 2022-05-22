definition initial_33_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_33_automaton = {
  ((Init p1, B, Noninit q2))}"
definition initial_33_ctr_loc where "initial_33_ctr_loc = {p0}"
definition initial_33_ctr_loc_st where "initial_33_ctr_loc_st = {q2}"
