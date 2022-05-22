definition initial_393_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_393_automaton = {
  ((Init p1, A, Noninit q3)),
  ((Init p1, B, Noninit q2))}"
definition initial_393_ctr_loc where "initial_393_ctr_loc = {p0}"
definition initial_393_ctr_loc_st where "initial_393_ctr_loc_st = {q2}"
