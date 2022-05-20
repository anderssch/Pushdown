definition initial_81_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_81_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, A, Noninit q2))}"
definition initial_81_ctr_loc where "initial_81_ctr_loc = {p0}"
definition initial_81_ctr_loc_st where "initial_81_ctr_loc_st = {q2}"
