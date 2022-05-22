definition final_86_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_86_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Init p1, B, Noninit q2))}"
definition final_86_ctr_loc where "final_86_ctr_loc = {p1}"
definition final_86_ctr_loc_st where "final_86_ctr_loc_st = {}"
