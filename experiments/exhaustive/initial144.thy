definition initial_144_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_144_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_144_ctr_loc where "initial_144_ctr_loc = {}"
definition initial_144_ctr_loc_st where "initial_144_ctr_loc_st = {q2}"
