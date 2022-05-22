definition initial_55_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_55_automaton = {
  ((Init p0, A, Noninit q3)),
  ((Init p0, A, Noninit q2))}"
definition initial_55_ctr_loc where "initial_55_ctr_loc = {p0, p1}"
definition initial_55_ctr_loc_st where "initial_55_ctr_loc_st = {q3}"
