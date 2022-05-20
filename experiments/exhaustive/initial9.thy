definition initial_9_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_9_automaton = {
  ((Init p0, A, Noninit q2))}"
definition initial_9_ctr_loc where "initial_9_ctr_loc = {p0}"
definition initial_9_ctr_loc_st where "initial_9_ctr_loc_st = {q2}"
