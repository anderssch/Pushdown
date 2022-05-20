definition initial_115_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_115_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, B, Noninit q3))}"
definition initial_115_ctr_loc where "initial_115_ctr_loc = {p0, p1}"
definition initial_115_ctr_loc_st where "initial_115_ctr_loc_st = {q2}"
