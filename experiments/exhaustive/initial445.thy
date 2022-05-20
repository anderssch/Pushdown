definition initial_445_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_445_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_445_ctr_loc where "initial_445_ctr_loc = {p0}"
definition initial_445_ctr_loc_st where "initial_445_ctr_loc_st = {q3}"
