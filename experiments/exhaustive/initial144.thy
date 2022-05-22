definition initial_144_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_144_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_144_ctr_loc where "initial_144_ctr_loc = {}"
definition initial_144_ctr_loc_st where "initial_144_ctr_loc_st = {q2}"
