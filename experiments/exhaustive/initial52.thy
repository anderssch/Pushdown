definition initial_52_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_52_automaton = {
  ((Initial p0, A, Noninitial q3)),
  ((Initial p0, A, Noninitial q2))}"
definition initial_52_ctr_loc where "initial_52_ctr_loc = {}"
definition initial_52_ctr_loc_st where "initial_52_ctr_loc_st = {q3}"
