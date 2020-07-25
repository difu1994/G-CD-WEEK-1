if(!file.exists("data")) {
        dir.create("data")
}



#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#download.file(fileURL, destfile = "./data/ACS.csv", method = "curl")


#data <- read.csv("./data/ACS.csv")


newdata <- data[data$VAL >= 24, ]
newdata <- na.omit(newdata[ ,"VAL"])
newdata

#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
#download.file(fileURL, destfile = "./data/ABC.xlsx", method = "curl")

colIndex <- 7:15
rowIndex <- 18:23

#excel <- read.xlsx("./data/ABC.xlsx", sheetIndex = 1, rowIndex = rowIndex, colIndex = colIndex )



fileURL2 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#key in address link of XML file
doc <- xmlTreeParse(fileURL2, useInternal = TRUE)
#xmlTreeParse does not support https, change link to http
rootNode <- xmlRoot(doc)        #split into layers
xmlName(rootNode)
names(rootNode)


XMLvalues <- xmlSApply(rootNode, )  
#logic <- rootNode[[1]][[100]][[2]][[1]] == "21223"











