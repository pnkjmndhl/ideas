def get_mean(a):
   sum=0
   for i in a:
      sum=sum+i
   return (sum/len(a))

def get_var(a):
   b = [ (val - get_mean(a))**2 for val in a]   
   return ((get_mean(b)*len(b))/(len(b)-1))     

#read values 
values = open('realvalues', 'r')
my_values = values.read().split() #cut the final space in list

#my_values.remove("") #remove empty rows

#convert the string list to float list
new_list = [] 
for i in my_values:
   new_list.append(float(i))

print('Given Values are: ',format(new_list))
print("Mean: ",get_mean(new_list))
print("Variance: ",format(get_var(new_list)))