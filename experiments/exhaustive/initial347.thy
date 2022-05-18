definition initial_347_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_347_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_347_ctr_loc where "initial_347_ctr_loc = {p0, p1}"
definition initial_347_ctr_loc_st where "initial_347_ctr_loc_st = {q2}"
