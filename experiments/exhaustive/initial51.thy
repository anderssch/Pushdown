definition initial_51_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_51_automaton = {
  ((Initial p0, A, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_51_ctr_loc where "initial_51_ctr_loc = {p0, p1}"
definition initial_51_ctr_loc_st where "initial_51_ctr_loc_st = {q2}"
