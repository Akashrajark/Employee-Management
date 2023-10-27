class EmployeeModel
{
final int id;
final String name;
final String created_at;
final String email;
final String contact_number;
final String date_of_joining;
bool isEligible=false;
bool isDeleted=false;

  EmployeeModel(this.id, this.name, this.created_at, this.email, this.contact_number, this.date_of_joining);

}

List<EmployeeModel> dummyEmployeeData = [
  EmployeeModel(101, "John Doe", "2023-05-15", "employee1@example.com", "+1 (555) 123-4567", "2018-03-10"),
  EmployeeModel(102, "Jane Smith", "2023-06-20", "employee2@example.com", "+1 (555) 234-5678", "2017-08-22"),
  EmployeeModel(103, "Alice Johnson", "2023-07-25", "employee3@example.com", "+1 (555) 345-6789", "2019-11-05"),
  EmployeeModel(104, "Bob Wilson", "2023-08-30", "employee4@example.com", "+1 (555) 456-7890", "2016-04-18"),
  EmployeeModel(105, "Eve Brown", "2023-09-05", "employee5@example.com", "+1 (555) 567-8901", "2022-01-10"),
];
