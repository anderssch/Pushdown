definition initial_137_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_137_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_137_ctr_loc where "initial_137_ctr_loc = {p0}"
definition initial_137_ctr_loc_st where "initial_137_ctr_loc_st = {q2}"
