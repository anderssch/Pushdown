definition initial_263_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_263_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, B, Noninitial q2))}"
definition initial_263_ctr_loc where "initial_263_ctr_loc = {p0, p1}"
definition initial_263_ctr_loc_st where "initial_263_ctr_loc_st = {}"
