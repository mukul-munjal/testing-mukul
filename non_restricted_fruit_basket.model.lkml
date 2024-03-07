connection: "rie_bigquery_no_touchy"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: fruit_basket {
  # required_access_grants: [explore_access]
  label: "フルーツ"
  group_label: "フルーツバスケット"
}

explore: paritioned_order_items_join {
  view_name: paritioned_order_items
  join: inventory_items {
    # type: left_outer
    sql: {% if paritioned_order_items.join_test._parameter_value == 'order_item' %}

         {% elsif paritioned_order_items.join_test._parameter_value == 'inventory_item' or inventory_items.product_category._is_filtered %}
          LEFT JOIN ${inventory_items.SQL_TABLE_NAME}  AS inventory_items
          ON ${inventory_items.id} = ${paritioned_order_items.inventory_item_id}
         {% endif %}  ;;
    # sql_on: ${inventory_items.id} = ${paritioned_order_items.inventory_item_id};;
    relationship: many_to_one
  }
}

# explore: paritioned_order_items {
#   join: pop_support {
#     view_label: "PoP Support - Overrides and Tools" #(Optionally) Update view label for use in this explore here, rather than in pop_support view. You might choose to align this to your POP date's view label.
#     relationship:one_to_one #we are intentionally fanning out, so this should stay one_to_one
#     sql:{% if pop_support.periods_ago._in_query%}LEFT JOIN pop_support on 1=1{%endif%};;
#     #join and fannout data for each prior_period included **if and only if** lynchpin pivot field (periods_ago) is selected. This safety measure ensures we dont fire any fannout join if the user selected PoP parameters from pop support but didn't actually select a pop pivot field.
#   }

# #(Optionally): Update this always filter to your base date field to encourage a filter.  Without any filter, 'future' periods will be shown when POP is used (because, for example: today's data is/will be technically 'last year' for next year)

# #always_filter: {filters: [order_items.created_date: "before 0 minutes ago"]}



# }
