definition initial_275_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_275_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_275_ctr_loc where "initial_275_ctr_loc = {p0, p1}"
definition initial_275_ctr_loc_st where "initial_275_ctr_loc_st = {q2}"
