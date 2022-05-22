definition initial_378_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_378_automaton = {
  ((Init p1, A, Noninit q2)),
  ((Noninit q2, B, Noninit q3))}"
definition initial_378_ctr_loc where "initial_378_ctr_loc = {p1}"
definition initial_378_ctr_loc_st where "initial_378_ctr_loc_st = {q2}"
