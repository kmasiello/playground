library(vetiver)
library(tidyverse)


data(Sacramento, package = "modeldata")

# reminder the plumber API was created from a particular model version.
model_url <- "https://colorado.rstudio.com/rsc/content/5a12bf71-2de5-4189-9110-f1e493f82a7a"

endpoint <- vetiver_endpoint(paste0(model_url,"/predict"))


new_sac <- Sacramento %>%
  slice_sample(n = 10) %>%
  select(type, sqft, beds, baths)

predict(endpoint, new_sac)
