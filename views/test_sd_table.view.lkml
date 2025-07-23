# If necessary, uncomment the line below to include explore_source.
# include: "test_project_thelook.model.lkml"

view: test_sd_table {
  derived_table: {
    sql: SELECT * FROM
    (SELECT
            `users`.`id` AS `id`,
            `users`.`first_name` AS `first_name`,
            `users`.`state` AS `state`,
            COUNT(DISTINCT products.id ) AS `products_count`
        FROM
            `demo_db`.`order_items` AS `order_items`
            LEFT JOIN `demo_db`.`orders` AS `orders` ON `order_items`.`order_id` = `orders`.`id`
            LEFT JOIN `demo_db`.`inventory_items` AS `inventory_items` ON `order_items`.`inventory_item_id` = `inventory_items`.`id`
            LEFT JOIN `demo_db`.`users` AS `users` ON `orders`.`user_id` = `users`.`id`
            LEFT JOIN `demo_db`.`products` AS `products` ON `inventory_items`.`product_id` = `products`.`id`
        GROUP BY
            1,
            2,
            3
        HAVING `products_count` > 15) AS `t1`
ORDER BY
    `products_count` DESC
LIMIT 500 ;;
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: first_name {
    description: ""
  }
  dimension: state {
    description: ""
  }
  dimension: products_count {
    description: ""
    type: number
  }
}
