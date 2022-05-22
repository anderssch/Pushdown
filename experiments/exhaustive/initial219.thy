definition initial_219_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_219_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition initial_219_ctr_loc where "initial_219_ctr_loc = {p0, p1}"
definition initial_219_ctr_loc_st where "initial_219_ctr_loc_st = {q2}"
