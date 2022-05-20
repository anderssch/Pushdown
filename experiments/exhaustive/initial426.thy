definition initial_426_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_426_automaton = {
  ((Init p1, B, Noninit q2)),
  ((Noninit q2, A, Noninit q2))}"
definition initial_426_ctr_loc where "initial_426_ctr_loc = {p1}"
definition initial_426_ctr_loc_st where "initial_426_ctr_loc_st = {q2}"
