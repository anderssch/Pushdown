definition initial_83_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_83_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_83_ctr_loc where "initial_83_ctr_loc = {p0, p1}"
definition initial_83_ctr_loc_st where "initial_83_ctr_loc_st = {q2}"
