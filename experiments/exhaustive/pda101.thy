definition pds_rules_101 :: "(ctr_loc, label) rule set" where
  "pds_rules_101 = {
  ((p0, A), (p0, push A A)),
  ((p0, B), (p1, swap A))}"
