definition pds_rules_365 :: "(ctr_loc, label) rule set" where
  "pds_rules_365 = {
  ((p1, A), (p0, push A A)),
  ((p1, B), (p1, swap A))}"
