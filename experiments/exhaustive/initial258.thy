definition initial_258_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_258_automaton = {
  ((Init p0, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_258_ctr_loc where "initial_258_ctr_loc = {p1}"
definition initial_258_ctr_loc_st where "initial_258_ctr_loc_st = {q2}"
