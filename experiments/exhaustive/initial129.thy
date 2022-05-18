definition initial_129_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_129_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_129_ctr_loc where "initial_129_ctr_loc = {p0}"
definition initial_129_ctr_loc_st where "initial_129_ctr_loc_st = {q2}"
