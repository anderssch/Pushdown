definition initial_99_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_99_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, A, Noninit q3))}"
definition initial_99_ctr_loc where "initial_99_ctr_loc = {p0, p1}"
definition initial_99_ctr_loc_st where "initial_99_ctr_loc_st = {q2}"
