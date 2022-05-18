definition initial_430_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_430_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_430_ctr_loc where "initial_430_ctr_loc = {p1}"
definition initial_430_ctr_loc_st where "initial_430_ctr_loc_st = {}"
