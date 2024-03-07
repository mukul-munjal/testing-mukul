# The name of this view in Looker is "Fruit Basket"
view: fruit_basket {
  label: "fruit_basket"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `rie-playground.e_commerce.fruit_basket` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Color" in Explore.

  dimension: color {
    label: "color"
    type: string
    sql: ${TABLE}.Color ;;
  }

  dimension: fruit_type {
    label: "fruit_type"
    type: string
    sql: ${TABLE}.FruitType ;;
  }

  dimension: is_round {
    label: "is_round"
    type: yesno
    sql: ${TABLE}.IsRound ;;
  }

  dimension: price {
    label: "price"
    type: number
    sql: ${TABLE}.Price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_price {
    type: sum
    value_format_name: usd
    sql: ${price} ;;  }

  measure: average_price {
    type: average
    value_format_name: usd
    sql: ${price} ;;  }

  dimension: priceper_pound {
    label: "@{priceper_pound}"
    type: number
    sql: ${TABLE}.PriceperPound ;;
  }

  # dimension: weight {
  #   type: number
  #   sql: ${TABLE}.Weight ;;
  # }

  # measure: total_weight {
  #   type: sum
  #   sql: ${weight} ;;
  #   value_format_name: decimal_2
  # }
  measure: count {
    label: "count"
    type: count
  }
}
