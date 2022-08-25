import numpy
#import random #you dont need this

#or import numpy as np

print("for M*N and N*O")
m = int(input("Enter M: "))
n = int(input("Enter N: "))
o = int(input("Enter O: "))

    #to generate random real values between 0 and 100
    #.astype(int) converts the float type to integers
#A = (100*numpy.random.random((m,n))).astype(int)
#B = (100*numpy.random.random((n,o))).astype(int)

    #or use this:
A = numpy.random.randint(0,100,(m,n),'I')
B = numpy.random.randint(0,100,(n,o),'I')

    #convert the real values to integers (only works for 1D Matrix or Lists)
#A = [int(i) for i in A]
#B = [int(i) for i in B]

print("The First Random Matrix of dimension {0} * {1} is ".format(m,n))
print(A)

print("The Second Random Matrix of dimension {0} * {1} is ".format(n,o))
print(B)

C = A.dot(B)

print("")
print("The Product matrix of dimensions {0} * {1} is:".format(m,o))
print(C)
