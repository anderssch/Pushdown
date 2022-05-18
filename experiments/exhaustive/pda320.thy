definition pds_rules_320 :: "(ctr_loc, label) rule set" where
  "pds_rules_320 = {
  ((p0, A), (p1, push B A)),
  ((p1, B), (p0, pop))}"
