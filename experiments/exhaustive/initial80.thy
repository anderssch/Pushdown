definition initial_80_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_80_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, A, Noninit q2))}"
definition initial_80_ctr_loc where "initial_80_ctr_loc = {}"
definition initial_80_ctr_loc_st where "initial_80_ctr_loc_st = {q2}"
