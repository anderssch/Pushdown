definition initial_200_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_200_automaton = {
  ((Init p0, B, Noninit q3)),
  ((Init p0, B, Noninit q2))}"
definition initial_200_ctr_loc where "initial_200_ctr_loc = {}"
definition initial_200_ctr_loc_st where "initial_200_ctr_loc_st = {q2, q3}"
