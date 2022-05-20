definition initial_386_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_386_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_386_ctr_loc where "initial_386_ctr_loc = {p1}"
definition initial_386_ctr_loc_st where "initial_386_ctr_loc_st = {q2, q3}"
