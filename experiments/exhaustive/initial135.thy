definition initial_135_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_135_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_135_ctr_loc where "initial_135_ctr_loc = {p0, p1}"
definition initial_135_ctr_loc_st where "initial_135_ctr_loc_st = {}"
