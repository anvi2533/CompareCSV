#install.packages("dplyr")
#install.packages("generics")

file_1 <- data.frame(read.csv("CSV_files/DevicesWithInventory_ea5cdce2-43db-4f36-8a32-1e0c0720b08a.csv"))
file_2 <- data.frame(read.csv("CSV_files/DevicesWithInventory_202c13df-3905-483e-b537-16f52eb1ca66.csv"))

nrow(file_1)
nrow(file_2)

name <- file_1$Primary.user.display.name
serial <- file_1$Serial.number
part_1 <- data.frame(name,serial)

name <- file_2$Primary.user.display.name
serial <- file_2$Serial.number
part_2 <- data.frame(name,serial)

for (col in colnames(part_1)) {
  Encoding(part_1[[col]]) <- "UTF-8"
}

for (col in colnames(part_2)) {
  Encoding(part_2[[col]]) <- "UTF-8"
}

#Compare file 1 and file 2

require(dplyr)
require(generics)

a <- anti_join(part_1,part_2)
b <- anti_join(part_2,part_1)
c <- rbind(a,b)

#matching rows
d <- generics::intersect(part_1,part_2)
write.csv(d,"matching_rows.csv", row.names = FALSE)
paste(nrow(d),"identical rows")

#mismatching rows
write.csv(c,"mismatching_rows.csv", row.names = FALSE)
paste(nrow(a), "rows in OLD file but not in NEW")
paste(nrow(b), "rows in NEW file but not in OLD")

serial_model <- file_1[,c(9,11)]
names(serial_model)[1] <- "serial"
names(serial_model)[2] <- "model"
serial_model_1 <- serial_model

serial_model <- file_2[,c(9,11)]
names(serial_model)[1] <- "serial"
names(serial_model)[2] <- "model"
serial_model_2 <- serial_model

a <- left_join(a,serial_model_1)
a$type <- "in old not in new"

b <- left_join(b,serial_model_2)
b$type <- "in new not in old"

rbind(a,b)








i = "Johanna Hartman"

part_1[part_1$name == i,]
part_2[part_2$name == i,]




