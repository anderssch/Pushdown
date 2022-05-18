definition initial_10_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_10_automaton = {
  ((Initial p0, A, Noninitial q2))}"
definition initial_10_ctr_loc where "initial_10_ctr_loc = {p1}"
definition initial_10_ctr_loc_st where "initial_10_ctr_loc_st = {q2}"
