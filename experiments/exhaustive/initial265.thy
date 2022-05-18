definition initial_265_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_265_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_265_ctr_loc where "initial_265_ctr_loc = {p0}"
definition initial_265_ctr_loc_st where "initial_265_ctr_loc_st = {q2}"
