definition initial_354_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_354_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_354_ctr_loc where "initial_354_ctr_loc = {p1}"
definition initial_354_ctr_loc_st where "initial_354_ctr_loc_st = {q2}"
