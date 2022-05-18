definition initial_282_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_282_automaton = {
  ((Initial p0, B, Noninitial q2)),
  ((Noninitial q2, A, Noninitial q3))}"
definition initial_282_ctr_loc where "initial_282_ctr_loc = {p1}"
definition initial_282_ctr_loc_st where "initial_282_ctr_loc_st = {q2, q3}"
