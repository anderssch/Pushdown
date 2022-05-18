definition pds_rules_330 :: "(ctr_loc, label) rule set" where
  "pds_rules_330 = {
  ((p0, A), (p1, push B A)),
  ((p1, B), (p1, pop))}"
