definition initial_42_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_42_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Init p0, B, Noninit q2))}"
definition initial_42_ctr_loc where "initial_42_ctr_loc = {p1}"
definition initial_42_ctr_loc_st where "initial_42_ctr_loc_st = {q2}"
