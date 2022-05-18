definition final_65_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_65_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition final_65_ctr_loc where "final_65_ctr_loc = {p0}"
definition final_65_ctr_loc_st where "final_65_ctr_loc_st = {q2}"
