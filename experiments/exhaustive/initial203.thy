definition initial_203_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_203_automaton = {
  ((Init p0, B, Noninit q3)),
  ((Init p0, B, Noninit q2))}"
definition initial_203_ctr_loc where "initial_203_ctr_loc = {p0, p1}"
definition initial_203_ctr_loc_st where "initial_203_ctr_loc_st = {q2, q3}"
