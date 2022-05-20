definition initial_209_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_209_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, A, Noninit q2))}"
definition initial_209_ctr_loc where "initial_209_ctr_loc = {p0}"
definition initial_209_ctr_loc_st where "initial_209_ctr_loc_st = {q2}"
