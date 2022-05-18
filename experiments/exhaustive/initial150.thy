definition initial_150_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_150_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_150_ctr_loc where "initial_150_ctr_loc = {p1}"
definition initial_150_ctr_loc_st where "initial_150_ctr_loc_st = {q3}"
