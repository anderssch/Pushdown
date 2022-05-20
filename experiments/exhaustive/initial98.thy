definition initial_98_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_98_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, A, Noninit q3))}"
definition initial_98_ctr_loc where "initial_98_ctr_loc = {p1}"
definition initial_98_ctr_loc_st where "initial_98_ctr_loc_st = {q2}"
