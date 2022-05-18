definition initial_323_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_323_automaton = {
  ((Initial p1, A, Noninitial q3)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_323_ctr_loc where "initial_323_ctr_loc = {p0, p1}"
definition initial_323_ctr_loc_st where "initial_323_ctr_loc_st = {q2, q3}"
