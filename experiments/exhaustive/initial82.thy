definition initial_82_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_82_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_82_ctr_loc where "initial_82_ctr_loc = {p1}"
definition initial_82_ctr_loc_st where "initial_82_ctr_loc_st = {q2}"
