definition initial_35_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_35_automaton = {
  ((Init p1, B, Noninit q2))}"
definition initial_35_ctr_loc where "initial_35_ctr_loc = {p0, p1}"
definition initial_35_ctr_loc_st where "initial_35_ctr_loc_st = {q2}"
