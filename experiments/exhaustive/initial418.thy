definition initial_418_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_418_automaton = {
  ((Initial p1, B, Noninitial q3)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_418_ctr_loc where "initial_418_ctr_loc = {p1}"
definition initial_418_ctr_loc_st where "initial_418_ctr_loc_st = {q2, q3}"
