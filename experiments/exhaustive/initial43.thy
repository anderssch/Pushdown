definition initial_43_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_43_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p0, B, Noninit q2))}"
definition initial_43_ctr_loc where "initial_43_ctr_loc = {p0, p1}"
definition initial_43_ctr_loc_st where "initial_43_ctr_loc_st = {q2}"
