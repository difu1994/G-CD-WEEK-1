#check to see if data folder exists, if not create "data" folder

if(!file.exists("data")) {
        dir.create("data")
}



##Find data source online
##Find export option
##Copy link address of .csv file

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/cameras.csv", method = "curl")
#"./data/cameras.csv" is the location + name of where to store .csv file
list.files("./data")
#"./" means current directory
#"../" means up one level from current directory



list.files("./data")
#"./" means current directory
#"../" means up one level from current directory


datedownloaded <- date()








