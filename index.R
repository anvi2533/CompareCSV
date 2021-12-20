#install.packages("dplyr")
#install.packages("generics")

file_1 <- data.frame(read.csv("CSV_files/DevicesWithInventory_4cec84c7-05ef-4a99-94c3-5a7313aee86a.csv"))
file_2 <- data.frame(read.csv("CSV_files/DevicesWithInventory_ea5cdce2-43db-4f36-8a32-1e0c0720b08a.csv"))

nrow(file_1)
nrow(file_2)

id <- file_1$ï..Device.ID
name <- file_1$Primary.user.display.name
serial <- file_1$Serial.number
comp_name <- file_1$Device.name
manufact <- file_1$Manufacturer
enrollment <- file_1$Enrollment.date
model <- file_1$Model

file_1 <- data.frame(id,name,serial,comp_name,manufact,enrollment,model)

id <- file_2$ï..Device.ID
name <- file_2$Primary.user.display.name
serial <- file_2$Serial.number
comp_name <- file_2$Device.name
manufact <- file_2$Manufacturer
enrollment <- file_2$Enrollment.date
model <- file_2$Model

file_2 <- data.frame(id,name,serial,comp_name,manufact,enrollment,model)

#Compare file 1 and file 2

require(dplyr)
require(generics)

a <- anti_join(file_1,file_2)
b <- anti_join(file_2,file_1)
c <- rbind(a,b)

#matching rows
d <- generics::intersect(file_1,file_2)
write.csv(d,"matching_rows.csv", row.names = FALSE)

#mismatching rows
write.csv(c,"mismatching_rows.csv", row.names = FALSE)