definition final_75_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_75_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition final_75_ctr_loc where "final_75_ctr_loc = {p0, p1}"
definition final_75_ctr_loc_st where "final_75_ctr_loc_st = {q2}"
