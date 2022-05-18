definition initial_303_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_303_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_303_ctr_loc where "initial_303_ctr_loc = {p0, p1}"
definition initial_303_ctr_loc_st where "initial_303_ctr_loc_st = {}"
