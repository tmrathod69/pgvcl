//optional para
void main()
{
    Student s1 = Student(surname:"xyz", name: "aryan",email: "a@gmail.com");
    Student s2 = Student(name: "Prince", surname: "xyz",email: "p@gmail.com");

    s1.display();
    s2.display();
}
class Student
{
    var name;
    var surname;
    var email;

    Student({var name,var surname,var email})
    {
        this.name=name;
        this.surname=surname;
        this.email=email;
    }

    display()
    {
        if(name!=null)
        {
              print("Your Name is $name");
        }
        if(surname!=null)
        {
            print("Your Surname is $surname");
        }
        if(email!=null)
        {
            print("Your email is $email");
        }
    }

}