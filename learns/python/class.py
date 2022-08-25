class Person(object):

   #constructor
   def __init__(self, name):
      self.name = name

   def getName(self):
      return self.name

   def isStudent(self):
      return False


   def isFaculty(self):
      return False



#inherited class
class Student(Person):
   def isStudent(self):
      return True


#inherited class
class Faculty(Person):
   def isFaculty(self):
      return True


person1= Person ("Pankaj")
print(person1.getName(), "is a student (",person1.isStudent(),") is a faculty member (",person1.isFaculty(),")")

person2= Student ("Pankaj")
print(person2.getName(), "is a student (",person2.isStudent(),") is a faculty member (",person2.isFaculty(),")")

person3= Faculty ("Kamal")
print(person3.getName(), "is a student (",person3.isStudent(),") is a faculty member (",person3.isFaculty(),")")


#checking
print(isinstance(person3,Person))

print(isinstance(person2,Faculty))

print(issubclass(Person,Faculty))



