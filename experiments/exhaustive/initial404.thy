definition initial_404_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_404_automaton = {
  ((Init p1, B, Noninit q3)),
  ((Init p1, B, Noninit q2))}"
definition initial_404_ctr_loc where "initial_404_ctr_loc = {}"
definition initial_404_ctr_loc_st where "initial_404_ctr_loc_st = {}"
