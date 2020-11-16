#==================== IMPORTA DATA

# Import swimming_pools.csv: pools
pools <- read.csv("swimming_pools.csv")

# Print the structure of pools
pools


# Option A
pools <- read.csv("swimming_pools.csv", stringsAsFactors = TRUE)

# Option B
pools2 <- read.csv("swimming_pools.csv", stringsAsFactors = FALSE)


# ----- Configurar Path

path <- file.path("01ImportData","hotdogs.txt")

#---- leer datos

hotdogs <- read.table(path,sep = "\t",col.names = c("type", "calories", "sodium"))


#Arguments
#Lily and Tom are having an argument because they want to share a hot dog 
#but they can't seem to agree on which one to choose. After some time, 
#they simply decide that they will have one each. Lily wants to have the 
#one with the fewest calories while Tom wants to have the one with the most sodium.

#Next to calories and sodium, the hotdogs have one more variable: type. 
#This can be one of three things: Beef, Meat, or Poultry, so a categorical 
#variable: a factor is fine.




hotdogs <- read.delim("hotdogs.txt", header = FALSE, 
                      col.names = c("type", "calories", "sodium"))

# Select the hot dog with the least calories: lily
lily <- hotdogs[which.min(hotdogs$calories), ]

# Select the observation with the most sodium: tom
tom <- hotdogs[which.max(hotdogs$sodium), ]

# Print lily and tom
lily
tom




#====================  Siguiente Ejemplo

# The read.delim() call from before is already included and creates the hotdogs data frame. Go ahead and display the structure of hotdogs.
# Edit the second read.delim() call. Assign the correct vector to the colClasses argument. NA should be replaced with a character vector: c("factor", "NULL", "numeric").
# Display the structure of hotdogs2 and look for the difference.

# Previous call to import hotdogs.txt
hotdogs <- read.delim(path, header = FALSE, col.names = c("type", "calories", "sodium"))

# Display structure of hotdogs

str(hotdogs)
# Edit the colClasses argument to import the data correctly: hotdogs2
hotdogs2 <- read.delim(path, header = FALSE, 
                       col.names = c("type", "calories", "sodium"),
                       colClasses = c("factor","NULL","numeric"))


# Display structure of hotdogs2
str(hotdogs2)

install.packages("readr")
library(readr)

# Read potatoes with readr, return tibble

getwd()
setwd("01ImportData")
potatoes <- read_csv("potatoes.csv")



#Read from txt
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")
potatoes2 <- read_tsv("potatoes.txt",properties) 

head(potatoes2)




# readr is already loaded

# Import without col_types
hotdogs <- read_tsv("hotdogs.txt", col_names = c("type", "calories", "sodium"))

# Display the summary of hotdogs
str(hotdogs)

# The collectors you will need to import the data
fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

# Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv("hotdogs.txt",
                           col_names = c("type", "calories", "sodium"),
                           col_types = cols(fac,int,int))

# Display the summary of hotdogs_factor
summary(hotdogs_factor)




# ===========================>>>>> data.table package
install.packages("data.table")


# load the data.table package using library()
library(data.table)

# Import potatoes.csv with fread(): potatoes
potatoes <- fread("potatoes.csv")

# Print out potatoes
potatoes



# read: more advanced use
# Now that you know the basics about fread(), you should know about two arguments of the function: drop and select, to drop or select variables of interest.

#Suppose you have a dataset that contains 5 variables and you want to keep the first and fifth variable, named "a" and "e". The following options will all do the trick:
  
#  fread("path/to/file.txt", drop = 2:4)
# fread("path/to/file.txt", select = c(1, 5))
# fread("path/to/file.txt", drop = c("b", "c", "d"))
# fread("path/to/file.txt", select = c("a", "e"))
# Let's stick with potatoes since we're particularly fond of them here at DataCamp. The data is again available in the file potatoes.csv, containing comma-separated records.


#Using fread() and select or drop as arguments, only import the texture and 
#moistness columns of the flat file. They correspond to the columns 6 and 8 in "potatoes.csv".
#Store the result in a variable potatoes.



# fread is already loaded

# Import columns 6 and 8 of potatoes.csv: potatoes
potatoes <- fread("potatoes.csv",select = c(6,8))

# Plot texture (x) and moistness (y) of potatoes

plot(x = potatoes$texture,y = potatoes$moistness)


