definition final_90_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_90_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Initial p1, B, Noninitial q2))}"
definition final_90_ctr_loc where "final_90_ctr_loc = {p1}"
definition final_90_ctr_loc_st where "final_90_ctr_loc_st = {q2}"
