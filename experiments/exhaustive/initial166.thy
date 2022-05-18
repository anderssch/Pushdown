definition initial_166_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_166_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q3))}"
definition initial_166_ctr_loc where "initial_166_ctr_loc = {p1}"
definition initial_166_ctr_loc_st where "initial_166_ctr_loc_st = {q3}"
