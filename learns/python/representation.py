x = "Pankaj"
y = 2.99

#for p in range(1,11):
	#print(repr(x).rjust(p), repr(x*x).rjust(p+6), repr(x*x*x).rjust(p+9))




for q in range(1,9):
	print(repr(x).rjust(q*q))



for r in range(1,11):
	print('{0:3d} {2:4d} {1:3d} {0} {0} {0}'.format(x,x*x,x*x*x))

