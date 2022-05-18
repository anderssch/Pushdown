theory Test_Setup
  imports PDS.PDS_Code
begin

abbreviation ctr_locN :: nat where "ctr_locN \<equiv> 2"
abbreviation labelN :: nat where "labelN \<equiv> 2"
abbreviation stateN :: nat where "stateN \<equiv> 4"

typedef ctr_loc = "{0 ..< ctr_locN}" by (auto intro!: exI[of _ 0])
typedef label = "{0 ..< labelN}" by (auto intro!: exI[of _ 0])
typedef state = "{0 ..< stateN}" by (auto intro!: exI[of _ 0])
setup_lifting type_definition_ctr_loc
setup_lifting type_definition_label
setup_lifting type_definition_state

instantiation ctr_loc :: finite begin
instance by (standard, rule finite_surj[of "{0 ..< ctr_locN}" _ Abs_ctr_loc])
  (simp, metis Rep_ctr_loc Rep_ctr_loc_inverse imageI subsetI)
end
instantiation label :: finite begin
instance by (standard, rule finite_surj[of "{0 ..< labelN}" _ Abs_label])
  (simp, metis Rep_label Rep_label_inverse imageI subsetI)
end
instantiation state :: finite begin
instance by (standard, rule finite_surj[of "{0 ..< stateN}" _ Abs_state])
  (simp, metis Rep_state Rep_state_inverse imageI subsetI)
end

lift_definition (code_dt) ctr_loc_list :: "ctr_loc list" is "[0 ..< ctr_locN]" by (auto simp: list.pred_set)
instantiation ctr_loc :: enum begin
definition "enum_ctr_loc = ctr_loc_list"
definition "enum_all_ctr_loc P = list_all P ctr_loc_list"
definition "enum_ex_ctr_loc P = list_ex P ctr_loc_list"
instance by (standard, auto simp: enum_ctr_loc_def enum_all_ctr_loc_def enum_ex_ctr_loc_def
       ctr_loc_list_def image_iff distinct_map inj_on_def Abs_ctr_loc_inject
       list.pred_map list.pred_set list_ex_iff) (metis Abs_ctr_loc_cases)+
end

instantiation ctr_loc :: linorder begin
lift_definition less_ctr_loc :: "ctr_loc \<Rightarrow> ctr_loc \<Rightarrow> bool" is "(<)" .
lift_definition less_eq_ctr_loc :: "ctr_loc \<Rightarrow> ctr_loc \<Rightarrow> bool" is "(\<le>)" .
instance by (standard; transfer) auto
end

instantiation ctr_loc :: equal begin
lift_definition equal_ctr_loc :: "ctr_loc \<Rightarrow> ctr_loc \<Rightarrow> bool" is "(=)" .
instance by (standard; transfer) auto
end

lift_definition (code_dt) label_list :: "label list" is "[0 ..< labelN]" by (auto simp: list.pred_set)
instantiation label :: enum begin
definition "enum_label = label_list"
definition "enum_all_label P = list_all P label_list"
definition "enum_ex_label P = list_ex P label_list"
instance by (standard, auto simp: enum_label_def enum_all_label_def enum_ex_label_def
       label_list_def image_iff distinct_map inj_on_def Abs_label_inject
       list.pred_map list.pred_set list_ex_iff) (metis Abs_label_cases)+
end

instantiation label :: linorder begin
lift_definition less_label :: "label \<Rightarrow> label \<Rightarrow> bool" is "(<)" .
lift_definition less_eq_label :: "label \<Rightarrow> label \<Rightarrow> bool" is "(\<le>)" .
instance by (standard; transfer) auto
end

instantiation label :: equal begin
lift_definition equal_label :: "label \<Rightarrow> label \<Rightarrow> bool" is "(=)" .
instance by (standard; transfer) auto
end

instantiation state :: equal begin
lift_definition equal_state :: "state \<Rightarrow> state \<Rightarrow> bool" is "(=)" .
instance by (standard; transfer) auto
end
lift_definition p0 :: ctr_loc is 0 by auto
lift_definition p1 :: ctr_loc is 1 by auto
lift_definition A :: label is 0 by auto
lift_definition B :: label is 1 by auto
lift_definition q0 :: state is 0 by auto
lift_definition q1 :: state is 1 by auto
lift_definition q2 :: state is 2 by auto
lift_definition q3 :: state is 3 by auto

end
