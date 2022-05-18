definition final_83_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_83_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Initial p1, A, Noninitial q2))}"
definition final_83_ctr_loc where "final_83_ctr_loc = {p0, p1}"
definition final_83_ctr_loc_st where "final_83_ctr_loc_st = {q2}"
