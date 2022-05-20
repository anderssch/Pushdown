definition initial_464_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_464_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_464_ctr_loc where "initial_464_ctr_loc = {}"
definition initial_464_ctr_loc_st where "initial_464_ctr_loc_st = {q2, q3}"
