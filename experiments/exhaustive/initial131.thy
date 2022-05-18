definition initial_131_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_131_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_131_ctr_loc where "initial_131_ctr_loc = {p0, p1}"
definition initial_131_ctr_loc_st where "initial_131_ctr_loc_st = {q2}"
