library(parsnip)
library(workflows)
library(vetiver)
library(pins)

data(Sacramento, package = "modeldata")

rf_spec <- rand_forest(mode = "regression")
rf_form <- price ~ type + sqft + beds + baths

rf_fit <-
  workflow(rf_form, rf_spec) %>%
  fit(Sacramento)

v <- vetiver_model(rf_fit, "katie_sacramento_rf")
v


board <- board_rsconnect()
board %>% vetiver_pin_write(v)

#see model versions
board %>% pin_versions("katie.masiello/katie_sacramento_rf")

#create a plumber API
board %>% vetiver_write_plumber("katie.masiello/katie_sacramento_rf",
                                    version = "56410",
                                    file ="sacramento_api/plumber.R")

#deploy plumber API (reminder deployAPI seeks project directory as input)
rsconnect::deployAPI("sacramento_api", server = "colorado.rstudio.com")

