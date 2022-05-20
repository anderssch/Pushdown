definition initial_118_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_118_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, B, Noninit q3))}"
definition initial_118_ctr_loc where "initial_118_ctr_loc = {p1}"
definition initial_118_ctr_loc_st where "initial_118_ctr_loc_st = {q3}"
