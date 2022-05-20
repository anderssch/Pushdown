definition initial_365_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_365_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_365_ctr_loc where "initial_365_ctr_loc = {p0}"
definition initial_365_ctr_loc_st where "initial_365_ctr_loc_st = {q3}"
