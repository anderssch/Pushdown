definition initial_410_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_410_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, B, Noninit q2))}"
definition initial_410_ctr_loc where "initial_410_ctr_loc = {p1}"
definition initial_410_ctr_loc_st where "initial_410_ctr_loc_st = {q2}"
