plot(cos, xlim=c(0, 2*pi)) #c() concatenates 0 and 2*pi
1:22 #sequence from 1 to 22

#sequence wil specific length
seq(from=0, to=pi,length.out=314) #fr=0 works (character matching)
c(1, 2, -10)

sum(1:100)

head(month.abb) #"Jan"
tail(month.name) #"January"

letters #character vector lower
LETTERS #character vector upper
letters[2]
letters[-(1:20)]

c(letters, month.abb)

#gets date as that format
#%b is month(abbreviated)
x = seq(from=as.Date('Jan 01, 2004', format='%b %d, %Y'),
        to=as.Date('2004-12-31'), #R already knows this format
        by='day'
        ) #makes table with headers and days
table(months(x))
which(x=="2004-09-01") #finds place of day (245th)

Sys.Date() #date
Sys.time() #date and time
as.Date('2017-12-31') - Sys.Date()

neighbour = 'November 22, 1969'
me = 'May 10, 2000'
as.Date(me, format='%b %d, %Y') - as.Date(neighbour, format='%b %d, %Y')

z = sample(letters, size=10) #random 10 letters
class(z)
print(z)

#R does the for loop for you, fastest way
#because all variables are vectorized
sqrt(1:4)
2^(1:4)
1:4 + seq(0, pi, length.out=4)

3 + 1:6 #shorter length object gets recycled
0:1 + 1:6 #adds 1 to every other number seq(0, 1) is recycled
#  0 1 0 1 0 1
#+ 1 2 3 4 5 6
#-------------
#  1 3 3 5 5 6

1:3 * 1:5 #uneven recycle, watch out (triggers warning but not error)
#  1 2 3 1 2
#x 1 2 3 4 5
#___________
#  1 4 9 4 10

b = 101:129
b %% 3 == 0 #sequence of booleans (TRUE if divisible by 3)

TRUE + FALSE #1
TRUE + TRUE #2
FALSE + FALSE #0

mean(C(T, T, F)) #short hand for TRUE and FALSE

ppl = sample(c("Male", "Female"),
             size=1e3,
             replace=T)
mean(ppl=="Male") #percentage of males

#matrices must be the same type
#3x3 matrix holding numbers 1-9
m = matrix(1:9, nrow=3) #map starting with columns default
#cuts out a 2x2 matrix
m[1:2, 1:2]
#empty space means all, ncol(m) means all, so they're equal
identical(m[1:2, ], m[1:2, 1:ncol(m)])
str(m)
m[4]
mean(m)
matrix(letters[1:9], nrow=3, byrow=T) #map starting with rows

#LISTS
#collection of possibly heterogeneous data types
my_info = list(first='Joe', last='Schmoe')
my_info$first == my_info[1]
my_info$first == 'Bob'
my_info[['first']]
my_info$weight_history = seq(0, 180, length.out=10)
my_info$age = 23
my_info$siblings = c(brothers=1, sisters=2) #named vector
str(my_info)
#a dataframe is a list of vectors where all the same length

n = 6
data3 = data.frame(id=1:n,
                   #n samples, from 100 to 200
                   weight=runif(n, min=100, max=200), #uniform distribution
                   birthm = sample(month.abb, size=n, replace=T)
                   )
data3[["id"]]
data3$id
data3[, "id"] #row by column

head(data.frame, 2) #strings have factors
days = data.frame(table(months(x)))
names(days) = c("month", "days")
days$month = as.character(days$month)
#
days$month = factor(days$month, levels=month.name)
days[order(days$month),] #order rows using factor

df = data.frame(y=rnorm(10),
                k=sample(letters[1:3], size=10, replace=T))

lm(y~k, df)

head(lm)
tail(lm)

my_function = function(theta) {
  x = cos(theta)
  y = sin(theta)
  c(x, y)
}

`+`(1, 10)
1:10 + 21:30

my_sum = function(x) Reduce(`+`, x)
my_sum(1:10)
sum(1:10)
  