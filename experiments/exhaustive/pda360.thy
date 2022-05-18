definition pds_rules_360 :: "(ctr_loc, label) rule set" where
  "pds_rules_360 = {
  ((p1, A), (p0, push A A)),
  ((p1, A), (p1, swap A))}"
