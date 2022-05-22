definition initial_374_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_374_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_374_ctr_loc where "initial_374_ctr_loc = {p1}"
definition initial_374_ctr_loc_st where "initial_374_ctr_loc_st = {}"
