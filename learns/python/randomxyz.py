import numpy

def avgdist(xval, yval,zval):
    dist=0
    n_dist = 0
    for i in range(0,len(xval)): #0 to n
        for j in range(i+1,len(xval)): #i to n
          dist = dist + ((xval[j] - xval[i])**2 + (yval[j] - yval[i])**2 + (zval[j] - zval[i])**2) **0.5
          n_dist = n_dist + 1
    if (n_dist == 0): #so that for 1 and 0 as input, we dont get an error.
        n_dist = 1
    dist= dist/n_dist
    return dist
    
n = 0
while n<=0:
    n = int(input("Enter the number of particles: "))
    if (n <=0):
        print("Number of particles cannot be zero or negative")

#create empty lists
xval = []
yval = []
zval = []

#append uniformly distributed values
#there are 3 for loops because the coordinates are independently uniformly distributed
for numbers in range(n):
    xval.append(numpy.random.uniform(0,1))

for numbers in range(n):
    yval.append(numpy.random.uniform(0,1))

for numbers in range(n):
    zval.append(numpy.random.uniform(0,1))

print("\nGenerated coordinates are: ")
#zip the values and convert them to array
print(numpy.array(zip(xval,yval,zval)))

#calling function
dist = avgdist(xval, yval, zval)

print("The average distance of {0} particles that makes {1} pairs is : {2}".format(n,(n*(n-1)/2),dist))



