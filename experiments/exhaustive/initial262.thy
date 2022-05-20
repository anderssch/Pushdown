definition initial_262_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_262_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_262_ctr_loc where "initial_262_ctr_loc = {p1}"
definition initial_262_ctr_loc_st where "initial_262_ctr_loc_st = {}"
