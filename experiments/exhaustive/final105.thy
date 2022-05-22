definition final_105_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_105_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_105_ctr_loc where "final_105_ctr_loc = {p0}"
definition final_105_ctr_loc_st where "final_105_ctr_loc_st = {q2}"
