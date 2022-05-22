definition initial_414_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_414_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, B, Noninit q2))}"
definition initial_414_ctr_loc where "initial_414_ctr_loc = {p1}"
definition initial_414_ctr_loc_st where "initial_414_ctr_loc_st = {q3}"
