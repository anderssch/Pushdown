definition initial_366_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_366_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, A, Noninit q3))}"
definition initial_366_ctr_loc where "initial_366_ctr_loc = {p1}"
definition initial_366_ctr_loc_st where "initial_366_ctr_loc_st = {q3}"
