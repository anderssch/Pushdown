definition initial_128_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_128_automaton = {
  ((Init p0, A, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_128_ctr_loc where "initial_128_ctr_loc = {}"
definition initial_128_ctr_loc_st where "initial_128_ctr_loc_st = {q2}"
