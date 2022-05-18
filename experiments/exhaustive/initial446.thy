definition initial_446_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_446_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_446_ctr_loc where "initial_446_ctr_loc = {p1}"
definition initial_446_ctr_loc_st where "initial_446_ctr_loc_st = {q3}"
