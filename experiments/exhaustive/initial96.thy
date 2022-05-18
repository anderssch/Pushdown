definition initial_96_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_96_automaton = {
  ((Initial p0, A, Noninitial q2)),
  ((Initial p1, A, Noninitial q3))}"
definition initial_96_ctr_loc where "initial_96_ctr_loc = {}"
definition initial_96_ctr_loc_st where "initial_96_ctr_loc_st = {q2}"
