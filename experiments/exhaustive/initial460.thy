definition initial_460_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_460_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_460_ctr_loc where "initial_460_ctr_loc = {}"
definition initial_460_ctr_loc_st where "initial_460_ctr_loc_st = {q3}"
