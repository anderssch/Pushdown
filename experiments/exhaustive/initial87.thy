definition initial_87_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_87_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_87_ctr_loc where "initial_87_ctr_loc = {p0, p1}"
definition initial_87_ctr_loc_st where "initial_87_ctr_loc_st = {}"
