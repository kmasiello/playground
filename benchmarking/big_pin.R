board <- pins::board_rsconnect()
start <- Sys.time()
logs <- pins::pin_read(board, "katie.masiello/logs")
end <- Sys.time()

(duration <- end - start)


logsqs <- logs
pin_write(board, logsqs, type = "qs")


start <- Sys.time()
logs2 <- pins::pin_read(board, "katie.masiello/logsqs")
end <- Sys.time()
