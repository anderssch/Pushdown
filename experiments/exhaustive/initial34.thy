definition initial_34_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_34_automaton = {
  ((Init p1, B, Noninit q2))}"
definition initial_34_ctr_loc where "initial_34_ctr_loc = {p1}"
definition initial_34_ctr_loc_st where "initial_34_ctr_loc_st = {q2}"
