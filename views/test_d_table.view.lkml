# If necessary, uncomment the line below to include explore_source.
# include: "test_project_thelook.model.lkml"

view: test_d_table {
  derived_table: {
    explore_source: order_items {
      column: brand { field: products.brand }
      column: department { field: products.department }
      column: pcount { field: products.count }
      column: ucount { field: users.count }
      filters: {
        field: products.department
        value: "Women"
      }
      filters: {
        field: users.count
        value: ">200"
      }
    }
  }
  dimension: brand {
    description: ""
  }
  dimension: department {
    description: ""
  }
  dimension: pcount {
    description: ""
    type: number
  }
  dimension: ucount {
    description: ""
    type: number
  }
}
