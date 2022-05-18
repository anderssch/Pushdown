definition pds_rules_128 :: "(ctr_loc, label) rule set" where
  "pds_rules_128 = {
  ((p0, B), (p0, push A B)),
  ((p0, A), (p0, swap B))}"
