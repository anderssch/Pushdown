definition final_121_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_121_automaton = {
  ((Initial p1, A, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q2))}"
definition final_121_ctr_loc where "final_121_ctr_loc = {p0}"
definition final_121_ctr_loc_st where "final_121_ctr_loc_st = {q2}"
