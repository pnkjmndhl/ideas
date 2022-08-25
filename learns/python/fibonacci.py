def fib2(n):
	"""Print the fibonacci numbers."""
	fibon = []
	a,b = 0,1
	while a < n:
		fibon.append(a)
		a,b = b, a+b
	return fibon

def fib(n):
	"""Print the fibonacci numbers."""
	a,b = 0,1
	while a < n:
		print(a, end = " ")
		a,b = b, a+b
	print()

if __name__ == "__main__":
	import sys
	fib (int(sys.argv[1]))

