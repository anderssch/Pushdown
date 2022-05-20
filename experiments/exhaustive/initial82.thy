definition initial_82_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_82_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p1, A, Noninit q2))}"
definition initial_82_ctr_loc where "initial_82_ctr_loc = {p1}"
definition initial_82_ctr_loc_st where "initial_82_ctr_loc_st = {q2}"
