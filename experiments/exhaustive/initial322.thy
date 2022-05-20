definition initial_322_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_322_automaton = {
  ((Init p1, A, Noninit q3)),
  ((Init p1, A, Noninit q2))}"
definition initial_322_ctr_loc where "initial_322_ctr_loc = {p1}"
definition initial_322_ctr_loc_st where "initial_322_ctr_loc_st = {q2, q3}"
