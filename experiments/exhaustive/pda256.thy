definition pds_rules_256 :: "(ctr_loc, label) rule set" where
  "pds_rules_256 = {
  ((p0, A), (p1, swap A)),
  ((p1, B), (p1, push B B))}"
