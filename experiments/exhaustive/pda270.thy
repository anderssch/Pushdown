definition pds_rules_270 :: "(ctr_loc, label) rule set" where
  "pds_rules_270 = {
  ((p0, A), (p1, push A A)),
  ((p1, B), (p0, swap A))}"
