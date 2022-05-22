definition initial_126_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_126_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_126_ctr_loc where "initial_126_ctr_loc = {p1}"
definition initial_126_ctr_loc_st where "initial_126_ctr_loc_st = {}"
