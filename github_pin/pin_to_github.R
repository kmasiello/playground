library(pins)


board <- legacy_github("kmasiello/playground", path = "github_pin")

# use legacy API to pin
pin(mtcars, board = board)


# can use modern API to read

# be sure to have the training / at the end of the path
board_01 <- board_url(c(
  mtcars =
    "https://raw.githubusercontent.com/kmasiello/playground/main/github_pin/mtcars/"))

board_01 %>% pin_read("mtcars")




