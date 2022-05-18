definition final_105_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_105_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition final_105_ctr_loc where "final_105_ctr_loc = {p0}"
definition final_105_ctr_loc_st where "final_105_ctr_loc_st = {q2}"
