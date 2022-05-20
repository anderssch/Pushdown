definition initial_133_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_133_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_133_ctr_loc where "initial_133_ctr_loc = {p0}"
definition initial_133_ctr_loc_st where "initial_133_ctr_loc_st = {}"
