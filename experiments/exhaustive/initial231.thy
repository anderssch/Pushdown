definition initial_231_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_231_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, A, Noninit q3))}"
definition initial_231_ctr_loc where "initial_231_ctr_loc = {p0, p1}"
definition initial_231_ctr_loc_st where "initial_231_ctr_loc_st = {q3}"
