definition initial_442_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_442_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_442_ctr_loc where "initial_442_ctr_loc = {p1}"
definition initial_442_ctr_loc_st where "initial_442_ctr_loc_st = {q2}"
