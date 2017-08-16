count_down = function(day) {
  return(as.Date(day) - Sys.Date())
}
#return() isn't necessary, R returns whatever outputed last

#APPLY FUNCTIONS
fun = function(x, max=100, predictable=F, seed=12345) {
  if(predictable) {
    set.seed(seed) #random will stay same
  }
  x + sample(1:max, size=1)
}

sapply(1:10, fun, max = 1000) #applies fun() to each of the sequence
#you can even pass in other parameters along with it
#simplified apply

#! Most scripts will start with this
names = list.files(pattern='\\.csv') #'\\' means things at front can be whatever
#'$' means it has to end with it
data = lapply(names, read.table) #list apply
data = do.call(rbind, data) #makes it into a dataframe, rowbind

identical({lapply(1:10, fun, predictable=T)},
          {sapply(1:10, fun, predictable=T, simplify=F)})

x = 1:10
names(x) = letters[x]
x
sapply(x, fun)

identical({mapply(fun, 1:10, predictable=T)}, #apply over multiple sets
          #function goes first instead
          {lapply(1:10, fun, predictable=T, simplify=F)})

rand = sample(c(T, F), 10, replace=T) #random sequence of booleans
mapply(fun, 1:10, predictable=rand) #somewill seed, some won't
seeds = sample(1:1e5, 10)
mapply(fun, x=1:10, seed=seeds, MoreArgs=list(predictable=T))

mat = matrix(1:9, nrow=3)
apply(mat, 2, sum) #columns sums
apply(mat, 1, sum) #row sums

data = matrix(runif(9), nrow=3)
data = data.frame(data)
lapply(data, fun) #applying with data frames
#applies to each column
new_vars = paste("V", 1:3)
data[, new_vars] = lapply(data, fun)

input = paste(sample(0:9, size=1000, replace=T), collapse="")
Split = function(obj, size=5) {
  end = length(obj) - size + 1
  idx = 1:end
  sapply(idx, function(i) obj[i:(i + size - 1)])
}

#splits string at each character into a list
#but it gets unlisted into a vector
digs = unlist(strsplit(input, split=''))
nums = as.numeric(digs)
mat = Split(nums)
max(apply(mat, 2, prod))

