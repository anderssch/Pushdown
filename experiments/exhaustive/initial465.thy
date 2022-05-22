definition initial_465_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_465_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_465_ctr_loc where "initial_465_ctr_loc = {p0}"
definition initial_465_ctr_loc_st where "initial_465_ctr_loc_st = {q2, q3}"
