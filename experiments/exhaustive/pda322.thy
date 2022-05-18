definition pds_rules_322 :: "(ctr_loc, label) rule set" where
  "pds_rules_322 = {
  ((p0, A), (p1, push B A)),
  ((p1, B), (p0, push A B))}"
