definition initial_65_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_65_automaton = {
  ((Init p0, B, Noninit q3)),
  ((Init p0, A, Noninit q2))}"
definition initial_65_ctr_loc where "initial_65_ctr_loc = {p0}"
definition initial_65_ctr_loc_st where "initial_65_ctr_loc_st = {q2}"
