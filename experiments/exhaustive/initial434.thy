definition initial_434_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_434_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition initial_434_ctr_loc where "initial_434_ctr_loc = {p1}"
definition initial_434_ctr_loc_st where "initial_434_ctr_loc_st = {q2}"
