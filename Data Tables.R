##Data Tables can be much faster than data frames at passing commands

DF <- data.frame(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))



DT <- data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))


#See all the data tables in memory
tables()

#subestting rows
DT[2, ]

#subsetting column doesnt usually work (second argument used to perform operations)
DT[ , c(1,3)]

#conditional subsetting
DT[DT$y == "a", ]

DTold <- copy(DT)

#adding new columns with operations (w which squares the values of z)
DTnew <- copy(DT[ , w:=z^2])    #Note: DT gets overwritten straight away
                                #use copy function to save copy of original

#adding new columns (multiple operations)
DTnew2 <- copy(DT[ , m:= {tmp <- (x+z); log2(tmp+5)}])
                                #multiple steps seperated using ;

#adding new columns (logic column)
DTnew3 <- copy(DT[ , a:= x>0])

##adding new columns (conditional operations using "by")
DTnew4 <- copy(DT[ , b:= mean(x+w), by = a])
#Take mean of x+w for when a = TRUE and FALSE separately


#####Keys
dt <- data.table(x = rep(c("a","b","c"), each = 100), y=rnorm(100))

setkey(dt, x)   #set x as the key in data table dt
dt["a"]         #key is automatically applied without specifying
                #equivalent to DT$x == "a"

####Joins using keys
DT1 <- data.table(x = c("a", "a", "b", "dt1"), y = 1:4)
DT2 <- data.table(x = c("a", "b","dt2"), z = 5:7)

setkey(DT1, x)
setkey(DT2, x)
DT3 <- merge(DT1, DT2)










