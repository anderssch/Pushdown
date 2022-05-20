definition initial_59_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_59_automaton = {
  ((Init p0, A, Noninit q3)),
  ((Init p0, A, Noninit q2))}"
definition initial_59_ctr_loc where "initial_59_ctr_loc = {p0, p1}"
definition initial_59_ctr_loc_st where "initial_59_ctr_loc_st = {q2, q3}"
