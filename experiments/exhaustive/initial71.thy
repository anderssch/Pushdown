definition initial_71_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_71_automaton = {
  ((Init p0, B, Noninit q3)),
  ((Init p0, A, Noninit q2))}"
definition initial_71_ctr_loc where "initial_71_ctr_loc = {p0, p1}"
definition initial_71_ctr_loc_st where "initial_71_ctr_loc_st = {q3}"
