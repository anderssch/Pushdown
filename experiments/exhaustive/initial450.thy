definition initial_450_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_450_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_450_ctr_loc where "initial_450_ctr_loc = {p1}"
definition initial_450_ctr_loc_st where "initial_450_ctr_loc_st = {q2, q3}"
