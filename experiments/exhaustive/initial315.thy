definition initial_315_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_315_automaton = {
  ((Initial p1, A, Noninitial q3)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_315_ctr_loc where "initial_315_ctr_loc = {p0, p1}"
definition initial_315_ctr_loc_st where "initial_315_ctr_loc_st = {q2}"
