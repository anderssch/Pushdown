definition final_96_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_96_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition final_96_ctr_loc where "final_96_ctr_loc = {}"
definition final_96_ctr_loc_st where "final_96_ctr_loc_st = {q2}"
