definition pds_rules_312 :: "(ctr_loc, label) rule set" where
  "pds_rules_312 = {
  ((p0, B), (p1, push A B)),
  ((p0, A), (p1, push B A))}"
