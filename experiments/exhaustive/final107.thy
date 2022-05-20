definition final_107_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "final_107_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, B, Noninit q2))}"
definition final_107_ctr_loc where "final_107_ctr_loc = {p0, p1}"
definition final_107_ctr_loc_st where "final_107_ctr_loc_st = {q2}"
