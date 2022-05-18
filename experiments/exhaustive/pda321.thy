definition pds_rules_321 :: "(ctr_loc, label) rule set" where
  "pds_rules_321 = {
  ((p0, A), (p1, push B A)),
  ((p1, B), (p0, swap A))}"
