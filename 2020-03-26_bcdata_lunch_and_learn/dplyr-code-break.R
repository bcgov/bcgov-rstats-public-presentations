
starwars



# %>% ---------------------------------------------------------------------

nrow(starwars)

starwars %>% nrow() 


# filter ------------------------------------------------------------------

starwars %>% 
  filter(species == "Human")



# select ------------------------------------------------------------------


starwars %>% 
  filter(species == "Human") %>% 
  select(name, height, mass, homeworld)



# mutate ------------------------------------------------------------------

starwars %>% 
  filter(species == "Human") %>% 
  select(name, height, mass, homeworld) %>% 
  mutate(bmi = mass/(height^2))



# filter (again) ----------------------------------------------------------

starwars %>% 
  filter(species == "Human") %>% 
  select(name, height, mass, homeworld) %>% 
  mutate(bmi = mass/(height^2)) %>% 
  filter(!is.na(bmi))


