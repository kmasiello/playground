library(pins)

board <- board_folder("/Users/katie/Dropbox/pins/")

a <- "toast"
b <- "jam"
c <- "butter"
d <- "coffee"
save(a, b, c, d, file = "breakfast.RData")

board %>% pin_upload("breakfast.RData")

(path_to_cached_file <- board %>% pin_download("breakfast.RData"))

load(path_to_cached_file)



### Alternatively

breakfast <- list(a, b, c, d)
board %>% pin_write(breakfast)
