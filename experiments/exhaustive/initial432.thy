definition initial_432_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_432_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_432_ctr_loc where "initial_432_ctr_loc = {}"
definition initial_432_ctr_loc_st where "initial_432_ctr_loc_st = {q2}"
