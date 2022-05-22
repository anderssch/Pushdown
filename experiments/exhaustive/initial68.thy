definition initial_68_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_68_automaton = {
  ((Init p0, B, Noninit q3)),
  ((Init p0, A, Noninit q2))}"
definition initial_68_ctr_loc where "initial_68_ctr_loc = {}"
definition initial_68_ctr_loc_st where "initial_68_ctr_loc_st = {q3}"
