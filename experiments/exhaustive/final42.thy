definition final_42_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_42_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p0, B, Noninitial q2))}"
definition final_42_ctr_loc where "final_42_ctr_loc = {p1}"
definition final_42_ctr_loc_st where "final_42_ctr_loc_st = {q2}"
