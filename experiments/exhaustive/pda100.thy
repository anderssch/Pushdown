definition pds_rules_100 :: "(ctr_loc, label) rule set" where
  "pds_rules_100 = {
  ((p0, A), (p0, push A A)),
  ((p0, B), (p1, pop))}"
