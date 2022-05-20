definition initial_168_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_168_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_168_ctr_loc where "initial_168_ctr_loc = {}"
definition initial_168_ctr_loc_st where "initial_168_ctr_loc_st = {q2, q3}"
