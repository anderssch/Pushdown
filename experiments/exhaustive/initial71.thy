definition initial_71_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_71_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_71_ctr_loc where "initial_71_ctr_loc = {p0, p1}"
definition initial_71_ctr_loc_st where "initial_71_ctr_loc_st = {q3}"
