definition initial_283_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_283_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_283_ctr_loc where "initial_283_ctr_loc = {p0, p1}"
definition initial_283_ctr_loc_st where "initial_283_ctr_loc_st = {q2, q3}"
