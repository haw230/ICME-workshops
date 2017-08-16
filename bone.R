bone_website = 'http://web.stanford.edu/~hastie/ElemStatLearn/datasets/bone.data'
data2 = read.table(url, sep='\t', header=TRUE)

summary(data2)
plot(data2)
