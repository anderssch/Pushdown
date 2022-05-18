definition initial_425_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_425_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition initial_425_ctr_loc where "initial_425_ctr_loc = {p0}"
definition initial_425_ctr_loc_st where "initial_425_ctr_loc_st = {q2}"
