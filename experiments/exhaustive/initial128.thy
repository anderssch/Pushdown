definition initial_128_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_128_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_128_ctr_loc where "initial_128_ctr_loc = {}"
definition initial_128_ctr_loc_st where "initial_128_ctr_loc_st = {q2}"
