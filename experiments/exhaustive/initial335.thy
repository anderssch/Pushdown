definition initial_335_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_335_automaton = {
  ((Initial p1, B, Noninitial q3)),
  ((Initial p1, A, Noninitial q2))}"
definition initial_335_ctr_loc where "initial_335_ctr_loc = {p0, p1}"
definition initial_335_ctr_loc_st where "initial_335_ctr_loc_st = {q3}"
