definition initial_427_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_427_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_427_ctr_loc where "initial_427_ctr_loc = {p0, p1}"
definition initial_427_ctr_loc_st where "initial_427_ctr_loc_st = {q2}"
