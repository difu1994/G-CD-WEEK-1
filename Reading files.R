
#read data functions --- read.table() or read.csv()

#table default assumes sep = " "
cameradata1 <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
#csv files has sep = ","
cameradata2 <- read.csv("./data/cameras.csv")

colnames(cameradata2) <- c("A","B","C","D","E","F","G","H","I")
#if need to change/create header name 


###read excel files
cameradataexcel <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, header = TRUE)
#sheetIndex describes which sheet to read

colIndex <- 2:3
rowIndex <- 1:4

cameradataexcelsub <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, rowIndex =rowIndex, colIndex = colIndex,  header = TRUE)
#choose specific rows/columns to read with colIndex and rowIndex args

#write.xlsx writes the dataframe into excel spreadsheet format
write.xlsx(cameradataexcelsub, file = "./data/cameras_sub.xlsx")



######read XML files

fileURL2 <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.xml?accessType=DOWNLOAD"
#key in address link of XML file
doc <- xmlTreeParse(fileURL2, useInternal = TRUE)
#xmlTreeParse does not support https, change link to http
rootNode <- xmlRoot(doc)        #split into layers
xmlName(rootNode)
names(rootNode)

#directly access parts of the XML document
a0 <- rootNode[[1]]             #XML first layer 
a1 <- rootNode[[1]][[1]]        #XML first element in first layer (similar to list)      
a2 <- rootNode[[1]][[1]][[1]]   #XML first sub element in first element of first layer


#Programatically extract parts of the XML file
XMLvalues <- xmlSApply(rootNode, xmlValue)      #extract contents of each layer



########Read JSON file
########JSON objects are usually nested (one inside another)

jsondata <- fromJSON("https://api.github.com/users/jtleek/repos")
jsonnames <- names(jsondata)            #names of first layer components
jsonownernames <- names(jsondata$owner) #owner is a first layer component
                                        #enter owner "folder" to second layer component
jsonownerloginnames <- names(jsondata$owner$login)
#empty as there is no more "folders" in "login" folder
#to look at contents, just
jsondata$owner$login













