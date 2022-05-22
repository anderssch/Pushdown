definition initial_166_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_166_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_166_ctr_loc where "initial_166_ctr_loc = {p1}"
definition initial_166_ctr_loc_st where "initial_166_ctr_loc_st = {q3}"
