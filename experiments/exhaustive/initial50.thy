definition initial_50_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_50_automaton = {
  ((Init p0, A, Noninit q3)),
  ((Init p0, A, Noninit q2))}"
definition initial_50_ctr_loc where "initial_50_ctr_loc = {p1}"
definition initial_50_ctr_loc_st where "initial_50_ctr_loc_st = {q2}"
