definition initial_306_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_306_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition initial_306_ctr_loc where "initial_306_ctr_loc = {p1}"
definition initial_306_ctr_loc_st where "initial_306_ctr_loc_st = {q2}"
