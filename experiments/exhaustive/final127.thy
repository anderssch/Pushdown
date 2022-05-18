definition final_127_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_127_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition final_127_ctr_loc where "final_127_ctr_loc = {p0, p1}"
definition final_127_ctr_loc_st where "final_127_ctr_loc_st = {}"
