

# bcdc_query_geodata ------------------------------------------------------

bcdc_query_geodata("municipalities-legally-defined-administrative-areas-of-bc")


# select ------------------------------------------------------------------

bcdc_query_geodata("municipalities-legally-defined-administrative-areas-of-bc") %>% 
  select(ADMIN_AREA_ABBREVIATION, ADMIN_AREA_GROUP_NAME, FEATURE_AREA_SQM) 



# filter ------------------------------------------------------------------

bcdc_query_geodata("municipalities-legally-defined-administrative-areas-of-bc") %>% 
  select(ADMIN_AREA_ABBREVIATION, ADMIN_AREA_GROUP_NAME, FEATURE_AREA_SQM) %>% 
  filter(ADMIN_AREA_GROUP_NAME == "Capital Regional District")



# collect -----------------------------------------------------------------

bcdc_query_geodata("municipalities-legally-defined-administrative-areas-of-bc") %>% 
  select(ADMIN_AREA_ABBREVIATION, ADMIN_AREA_GROUP_NAME, FEATURE_AREA_SQM) %>% 
  filter(ADMIN_AREA_GROUP_NAME == "Capital Regional District") %>% 
  collect()