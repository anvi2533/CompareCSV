file_1 <- data.frame(read.csv("CSV_files/DevicesWithInventory_5e5c3260-8605-478c-9a0d-67924ce5ccca.csv"))
file_2 <- data.frame(read.csv("CSV_files/DevicesWithInventory_ea5cdce2-43db-4f36-8a32-1e0c0720b08a.csv"))


id <- file_1$ï..Device.ID
name <- file_1$Primary.user.display.name
serial <- file_1$Serial.number
manufact <- file_1$Manufacturer
enrollment <- file_1$Enrollment.date
model <- file_1$Model

file_1 <- data.frame(id,name,serial,manufact,enrollment,model)

id <- file_2$ï..Device.ID
name <- file_2$Primary.user.display.name
serial <- file_2$Serial.number
manufact <- file_2$Manufacturer
enrollment <- file_2$Enrollment.date
model <- file_2$Model

file_2 <- data.frame(id,name,serial,manufact,enrollment,model)

a <- file_1$serial
b <- file_2$serial

b[190] <- "test"

unique(b[! b %in% a])
unique(a[! a %in% b])
