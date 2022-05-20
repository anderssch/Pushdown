definition initial_338_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_338_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_338_ctr_loc where "initial_338_ctr_loc = {p1}"
definition initial_338_ctr_loc_st where "initial_338_ctr_loc_st = {q2, q3}"
