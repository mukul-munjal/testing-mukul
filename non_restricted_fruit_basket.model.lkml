connection: "rie_bigquery_no_touchy"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: fruit_basket {
  # required_access_grants: [explore_access]
  label: "フルーツ"
}

explore: paritioned_order_items {
  join: pop_support {
    view_label: "PoP Support - Overrides and Tools" #(Optionally) Update view label for use in this explore here, rather than in pop_support view. You might choose to align this to your POP date's view label.
    relationship:one_to_one #we are intentionally fanning out, so this should stay one_to_one
    sql:{% if pop_support.periods_ago._in_query%}LEFT JOIN pop_support on 1=1{%endif%};;
    #join and fannout data for each prior_period included **if and only if** lynchpin pivot field (periods_ago) is selected. This safety measure ensures we dont fire any fannout join if the user selected PoP parameters from pop support but didn't actually select a pop pivot field.
  }

#(Optionally): Update this always filter to your base date field to encourage a filter.  Without any filter, 'future' periods will be shown when POP is used (because, for example: today's data is/will be technically 'last year' for next year)

#always_filter: {filters: [order_items.created_date: "before 0 minutes ago"]}



}
