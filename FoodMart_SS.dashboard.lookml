- dashboard: the_other_guys_ss_yearly_product_sales
  title: 'The Other Guys (ss): Yearly Product Sales'
  layout: newspaper
  elements:
  - title: 'The Other Guys: Yearly Product Sales'
    name: 'The Other Guys: Yearly Product Sales'
    model: foodmartusa_sqlserver
    explore: sales_fact
    type: looker_column
    fields: [sales_fact.sales_year, sales_fact.total_store_sales]
    fill_fields: [sales_fact.sales_year]
    sorts: [sales_fact.sales_year desc]
    limit: 500
    column_limit: 50
    stacking: normal
    color_application:
      collection_id: legacy
      palette_id: black_to_gray
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Product Family: product_class.product_family
      Region: region.name
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Product Family
    title: Product Family
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: foodmartusa_sqlserver
    explore: sales_fact
    listens_to_filters: []
    field: product_class.product_family
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: foodmartusa_sqlserver
    explore: sales_fact
    listens_to_filters: []
    field: region.name
