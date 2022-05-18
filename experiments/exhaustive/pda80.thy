definition pds_rules_80 :: "(ctr_loc, label) rule set" where
  "pds_rules_80 = {
  ((p0, A), (p0, swap A)),
  ((p1, A), (p1, push A A))}"
