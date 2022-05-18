definition final_63_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_63_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition final_63_ctr_loc where "final_63_ctr_loc = {p0, p1}"
definition final_63_ctr_loc_st where "final_63_ctr_loc_st = {}"
