definition initial_410_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_410_automaton = {
  ((Initial p1, B, Noninitial q3)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_410_ctr_loc where "initial_410_ctr_loc = {p1}"
definition initial_410_ctr_loc_st where "initial_410_ctr_loc_st = {q2}"
