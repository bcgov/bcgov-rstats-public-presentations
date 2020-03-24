# Copyright 2020 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.




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




# summarise ---------------------------------------------------------------

starwars %>% 
  filter(species == "Human") %>% 
  select(name, height, mass, homeworld) %>% 
  mutate(bmi = mass/(height^2)) %>% 
  filter(!is.na(bmi)) %>% 
  summarise(smu_bmi = sum(bmi))



# group_by ----------------------------------------------------------------


starwars %>% 
  filter(species == "Human") %>% 
  select(name, height, mass, homeworld) %>% 
  mutate(bmi = mass/(height^2)) %>% 
  filter(!is.na(bmi)) %>% 
  group_by(homeworld) %>% 
  summarise(mean_bmi = mean(bmi))


# arrange -----------------------------------------------------------------

starwars %>% 
  filter(species == "Human") %>% 
  select(name, height, mass, homeworld) %>% 
  mutate(bmi = mass/(height^2)) %>% 
  filter(!is.na(bmi)) %>% 
  group_by(homeworld) %>% 
  summarise(mean_bmi = mean(bmi)) %>% 
  arrange(mean_bmi)
