definition initial_430_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_430_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_430_ctr_loc where "initial_430_ctr_loc = {p1}"
definition initial_430_ctr_loc_st where "initial_430_ctr_loc_st = {}"
