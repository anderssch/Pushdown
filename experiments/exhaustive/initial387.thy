definition initial_387_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_387_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_387_ctr_loc where "initial_387_ctr_loc = {p0, p1}"
definition initial_387_ctr_loc_st where "initial_387_ctr_loc_st = {q2, q3}"
