resource "snowflake_warehouse" "transform" {
  name           = "MDP_TRANSFORM_WH"
  warehouse_size = "X-Small"
  auto_suspend   = 60
  auto_resume    = true
  comment        = "Cost-controlled warehouse for Modern Data Platform transformations"
}