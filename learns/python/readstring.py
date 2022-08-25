#read values from user
matchedwordpos = -1 
userinput = input("Enter the string: ")

my_values = [] #creating an empty list
values = open('strings', 'r')
my_values = values.read().split('\n')
values.close()

for eachline in my_values:
   print(eachline)   
   
checker = 0
for k in range(len(my_values)):
   matchedwordpos = my_values[k].find(userinput)
   if(matchedwordpos) >= 0 :
      print("Match found on line ", k+1, " Letter number is ", matchedwordpos)
      checker = 1
   if (checker == 0 and k==len(my_values)-1  ): #if not matched for all, matchedwordpos is negative
      print("No matched words.")
   