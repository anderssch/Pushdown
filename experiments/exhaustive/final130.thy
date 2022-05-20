definition final_130_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_130_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_130_ctr_loc where "final_130_ctr_loc = {p1}"
definition final_130_ctr_loc_st where "final_130_ctr_loc_st = {q2}"
