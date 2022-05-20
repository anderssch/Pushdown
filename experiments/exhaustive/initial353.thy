definition initial_353_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_353_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_353_ctr_loc where "initial_353_ctr_loc = {p0}"
definition initial_353_ctr_loc_st where "initial_353_ctr_loc_st = {q2}"
