definition initial_415_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_415_automaton = {
  ((Initial p1, B, Noninitial q3)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_415_ctr_loc where "initial_415_ctr_loc = {p0, p1}"
definition initial_415_ctr_loc_st where "initial_415_ctr_loc_st = {q3}"
