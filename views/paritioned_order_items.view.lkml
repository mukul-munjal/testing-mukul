view: paritioned_order_items {
  sql_table_name: `rie-playground.e_commerce.paritioned_order_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    # label: "created"
    type: time
    timeframes: [time, date, week, month, quarter, year, week_of_year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    label: "order_id"
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
