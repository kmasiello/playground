library(pins)
library(palmerpenguins)

board <- board_folder("/Users/katie/Dropbox/pins/",
                      versioned = FALSE)



board %>% pin_write(penguins)

timestamp <-
  tibble::tibble(date = Sys.Date(),
                 time = format(Sys.time(), "%X"))


board %>% pin_write(timestamp,
                    versioned = TRUE,
                    metadata = list("project_author" = "katie.masiello",
                                    "department" = "solutions engineering"))

board %>% pin_list()
board %>% pin_search("")
board %>% pin_search("penguins")
board %>% pin_meta("timestamp")
board %>% pin_versions("timestamp")



board %>% pin_versions_prune("timestamp", n=2)
board %>% pin_versions("timestamp")



