connection: "rie_bigquery_no_touchy"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# access_grant: explore_access {
#   allowed_values: ["yes"]
#   user_attribute: can_see
# }

explore: fruit_basket {
  # required_access_grants: [explore_access]
  group_label: "フルーツバスケット"
}
