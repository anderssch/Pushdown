definition initial_342_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_342_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_342_ctr_loc where "initial_342_ctr_loc = {p1}"
definition initial_342_ctr_loc_st where "initial_342_ctr_loc_st = {}"
