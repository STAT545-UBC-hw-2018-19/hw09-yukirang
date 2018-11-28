library(stringr)
words <- readLines("words.txt")

# Initialize an empty data frame
df <- data.frame(matrix(ncol = 2, nrow = 0))
# collect the repeat patterns in a list 
# i.e. e[1] == "aa" e[2] == "bb" e[3] =="cc" ...
e<-paste(letters,letters, sep="")
# for each pattern, calculate the appearing times
# and bind it as a row in data frame
for (i in 1:length(e)) {
  rep <- e[i]
  freq <- sum(str_count(words, pattern = rep))
  df <-rbind(df,data.frame(rep,freq))
}
# write the table in a .tsv file
write.table(df, "repeat.tsv",
            sep = "\t", row.names = FALSE, quote = FALSE)