definition initial_147_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_147_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_147_ctr_loc where "initial_147_ctr_loc = {p0, p1}"
definition initial_147_ctr_loc_st where "initial_147_ctr_loc_st = {q2}"
