definition initial_416_automaton :: "((ctr_loc, state, label) PDS.state, label) transition set" where
  "initial_416_automaton = {
  ((Initial p1, B, Noninitial q3)),
  ((Initial p1, B, Noninitial q2))}"
definition initial_416_ctr_loc where "initial_416_ctr_loc = {}"
definition initial_416_ctr_loc_st where "initial_416_ctr_loc_st = {q2, q3}"
