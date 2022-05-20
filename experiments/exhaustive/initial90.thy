definition initial_90_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_90_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition initial_90_ctr_loc where "initial_90_ctr_loc = {p1}"
definition initial_90_ctr_loc_st where "initial_90_ctr_loc_st = {q2}"
