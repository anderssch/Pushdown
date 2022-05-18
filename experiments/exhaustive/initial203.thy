definition initial_203_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_203_automaton = {
  ((Initial p0, B, Noninitial q3)),
  ((Initial p0, B, Noninitial q2))}"
definition initial_203_ctr_loc where "initial_203_ctr_loc = {p0, p1}"
definition initial_203_ctr_loc_st where "initial_203_ctr_loc_st = {q2, q3}"
