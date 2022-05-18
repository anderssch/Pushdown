definition pds_rules_384 :: "(ctr_loc, label) rule set" where
  "pds_rules_384 = {
  ((p1, A), (p0, push B A)),
  ((p1, B), (p1, pop))}"
