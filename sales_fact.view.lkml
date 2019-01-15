view: sales_fact {
  sql_table_name: dbo.sales_fact ;;

  dimension: time_marker_s1 {
    type: string
    sql: 'marker_s1' ;;
  }

  dimension: time_marker_s2 {
    type: string
    sql: 'marker_s2' ;;
  }

   dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: promotion_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.promotion_id ;;
  }

  dimension_group: sales {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sales_date ;;
  }

  dimension: store_cost {
    type: number
    sql: ${TABLE}.store_cost ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension: store_sales {
    type: string
    sql: ${TABLE}.store_sales ;;
  }

  dimension: unit_sales {
    type: string
    sql: ${TABLE}.unit_sales ;;
  }

  dimension: current_time_to_avoid_caching {
    type: date_time
    sql: getdate();;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_store_sales {
    type: average
    sql: ${store_sales} ;;
    drill_fields: [detail*]
  }

  measure: average_unit_sales {
    type: average
    sql: ${unit_sales} ;;
    drill_fields: [detail*]
  }

  measure: average_store_cost {
    type: average
    sql: ${store_cost} ;;
    drill_fields: [detail*]
  }

  measure: total_store_sales {
    type: sum
    sql: ${store_sales} ;;
    drill_fields: [detail*]
  }

  measure: total_unit_sales {
    type: sum
    sql: ${unit_sales} ;;
    drill_fields: [detail*]
  }

  measure: total_store_cost {
    type: sum
    sql: ${store_cost} ;;
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product.product_id,
      product.brand_name,
      product.product_name,
      customer.fname,
      customer.lname,
      customer.customer_id,
      customer.fullname,
      promotion.promotion_id,
      promotion.promotion_name,
      store.store_id,
      store.name
    ]
  }
}
