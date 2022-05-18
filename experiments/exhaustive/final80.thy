definition final_80_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_80_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Initial p1, A, Noninitial q2))}"
definition final_80_ctr_loc where "final_80_ctr_loc = {}"
definition final_80_ctr_loc_st where "final_80_ctr_loc_st = {q2}"
