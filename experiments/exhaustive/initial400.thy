definition initial_400_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_400_automaton = {
  ((Init p1, A, Noninit q3)),
  ((Init p1, B, Noninit q2))}"
definition initial_400_ctr_loc where "initial_400_ctr_loc = {}"
definition initial_400_ctr_loc_st where "initial_400_ctr_loc_st = {q2, q3}"
