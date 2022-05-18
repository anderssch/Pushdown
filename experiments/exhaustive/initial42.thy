definition initial_42_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_42_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p0, B, Noninitial q2))}"
definition initial_42_ctr_loc where "initial_42_ctr_loc = {p1}"
definition initial_42_ctr_loc_st where "initial_42_ctr_loc_st = {q2}"
