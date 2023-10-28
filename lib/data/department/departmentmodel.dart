class DepartmentModel
{
  final int id;
  final String name;
  final String location;
  final String manager_id;
  final int no_of_employees;
  final String created_on;
  bool isDeleted=false;

  DepartmentModel( {required this.id, required this.name, required this.location, required this.manager_id, required this.no_of_employees, required this.created_on,});
}

List<DepartmentModel> dummyDepartments = [
  DepartmentModel(
    id: 1,
    name: "Human Resources",
    location: "Headquarters",
    manager_id: "1",
    no_of_employees: 20,
    created_on: "2023-01-10",
  ),
  DepartmentModel(
    id: 2,
    name: "Finance",
    location: "Downtown Office",
    manager_id: "2",
    no_of_employees: 15,
    created_on: "2023-02-15",
  ),
  DepartmentModel(
    id: 3,
    name: "Information Technology",
    location: "Tech Park",
    manager_id: "3",
    no_of_employees: 30,
    created_on: "2023-03-20",
  ),
  // Add more dummy departments here as needed
];
