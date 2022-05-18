definition initial_250_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_250_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Initial p1, B, Noninitial q3))}"
definition initial_250_ctr_loc where "initial_250_ctr_loc = {p1}"
definition initial_250_ctr_loc_st where "initial_250_ctr_loc_st = {q2, q3}"
