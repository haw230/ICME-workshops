#R is dynamically typed,object-oriented, vectorized, one-based
#functions change depending on data type(e.g: summary())
ozone_website="http://web.stanford.edu/~hastie/ElemStatLearn/datasets/ozone.data"

#loads website, separated by tabs, there is a header
#data type is a data frame
data = read.table(ozone_website, sep='\t', header=TRUE)
#columns are vectors

head(data) #returns first 6 rows
dim(data) #returns rows by columns
summary(data) #returns summaries of each row

#[rows,columns] (inclusive index)
#ncol() returns number of columns
#negative indexes work too
data[3:6, 2:ncol(data)]

str(data) #structure, returns types of columns and some values

plot(data[,1:4]) #empty means all
hist(data$ozone) #'$' accesses specific data
hist(data[[1]]) #can be accessed like this
plot(data$ozone, data$radiations) #plots parameters (x, y)

model = lm(ozone~radiation, data) #linear model, ozone as a function of radiation
summary(model)
plot(model)

#'.' refers to whatever was previously in the model
#left dot and right dot are different
#update returns a whole new model
#'*' means relationship between the two columns
m = update(model, .~. + temperature * radiation)
plot(m)

#object-oriented, functions are first class objects
#head() was first used to get the 6 columns
head(summary.lm)
head(Summary.data.frame)

