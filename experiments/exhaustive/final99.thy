definition final_99_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_99_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition final_99_ctr_loc where "final_99_ctr_loc = {p0, p1}"
definition final_99_ctr_loc_st where "final_99_ctr_loc_st = {q2}"
