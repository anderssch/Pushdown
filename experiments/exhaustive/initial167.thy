definition initial_167_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_167_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_167_ctr_loc where "initial_167_ctr_loc = {p0, p1}"
definition initial_167_ctr_loc_st where "initial_167_ctr_loc_st = {q3}"
