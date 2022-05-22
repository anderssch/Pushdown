definition initial_286_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_286_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_286_ctr_loc where "initial_286_ctr_loc = {p1}"
definition initial_286_ctr_loc_st where "initial_286_ctr_loc_st = {}"
