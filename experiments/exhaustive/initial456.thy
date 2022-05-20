definition initial_456_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_456_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_456_ctr_loc where "initial_456_ctr_loc = {}"
definition initial_456_ctr_loc_st where "initial_456_ctr_loc_st = {q2}"
