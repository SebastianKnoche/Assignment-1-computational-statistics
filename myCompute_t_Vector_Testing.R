# The following calculation proves the function my.compute.tVector is implemented correctly
source(file="assignment_1_function_lib.R")

# The Values are taken from the assignment example 
test1= c(0.9344014   ,1.360619    ,1.322071    ,2.5589608   ,1.151102)
test2= c(-0.2159358,   5.358126,    3.423067,    0.6043203,   6.037797)
testmatrix=rbind(test1,test2)

# Assuming function my.tstat is correct
# get control values

my.tstat(test1,2)
my.tstat(test2,2)

# apply the function 

testmatrix
my.compute.tVector(testmatrix,2)
