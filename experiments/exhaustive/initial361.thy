definition initial_361_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_361_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_361_ctr_loc where "initial_361_ctr_loc = {p0}"
definition initial_361_ctr_loc_st where "initial_361_ctr_loc_st = {q2}"
