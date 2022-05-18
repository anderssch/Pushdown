definition initial_53_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_53_automaton = {
  ((Initial p0, A, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_53_ctr_loc where "initial_53_ctr_loc = {p0}"
definition initial_53_ctr_loc_st where "initial_53_ctr_loc_st = {q3}"
