definition initial_371_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_371_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_371_ctr_loc where "initial_371_ctr_loc = {p0, p1}"
definition initial_371_ctr_loc_st where "initial_371_ctr_loc_st = {q2, q3}"
