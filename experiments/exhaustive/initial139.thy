definition initial_139_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_139_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_139_ctr_loc where "initial_139_ctr_loc = {p0, p1}"
definition initial_139_ctr_loc_st where "initial_139_ctr_loc_st = {q2}"
