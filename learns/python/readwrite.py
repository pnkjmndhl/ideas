f = open('pythonREADME')
f.read()

f.seek(0)

f.readline() #reads the first line, until it reads a newline character
f.readline() #reads the second line

f.seek(0) #goto first

print(f.read(1)) #read 1 character

#pointer is in the seek file

for line in f:
	print(line, end = '**')
f.close()


newfile = open('blah','w')
newfile.write("My new file")

print(newfile.tell())

newfile.seek(0)
print(newfile.tell())

f.close()

p = open('blah','a')
p.write('\n more new stuffs')

p.close()
#you cant seek to the beginning in an append mode.


#read and write a file

fw = open('blah', 'r+')
fw.write("more more freaking stuffs")
fw.close()

print("the file is ", fw.closed, "ly closed")

#seek garney and print garney



#a = append
#r = read
#r+ = read and write


#binary: read the characters as bytes

