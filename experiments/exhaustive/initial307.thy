definition initial_307_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_307_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_307_ctr_loc where "initial_307_ctr_loc = {p0, p1}"
definition initial_307_ctr_loc_st where "initial_307_ctr_loc_st = {q2}"
