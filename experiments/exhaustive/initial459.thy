definition initial_459_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_459_automaton = {
  ((Initial p1, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_459_ctr_loc where "initial_459_ctr_loc = {p0, p1}"
definition initial_459_ctr_loc_st where "initial_459_ctr_loc_st = {q2}"
