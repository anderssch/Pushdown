definition initial_163_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_163_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_163_ctr_loc where "initial_163_ctr_loc = {p0, p1}"
definition initial_163_ctr_loc_st where "initial_163_ctr_loc_st = {q2}"
