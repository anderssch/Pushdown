definition initial_382_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_382_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_382_ctr_loc where "initial_382_ctr_loc = {p1}"
definition initial_382_ctr_loc_st where "initial_382_ctr_loc_st = {q3}"
