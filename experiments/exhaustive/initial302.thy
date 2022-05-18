definition initial_302_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_302_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_302_ctr_loc where "initial_302_ctr_loc = {p1}"
definition initial_302_ctr_loc_st where "initial_302_ctr_loc_st = {}"
