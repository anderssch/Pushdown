definition initial_192_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_192_automaton = {
  ((Init p0, B, Noninit q3)),
  ((Init p0, B, Noninit q2))}"
definition initial_192_ctr_loc where "initial_192_ctr_loc = {}"
definition initial_192_ctr_loc_st where "initial_192_ctr_loc_st = {q2}"
