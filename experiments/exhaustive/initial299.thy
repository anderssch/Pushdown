definition initial_299_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_299_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_299_ctr_loc where "initial_299_ctr_loc = {p0, p1}"
definition initial_299_ctr_loc_st where "initial_299_ctr_loc_st = {q2, q3}"
