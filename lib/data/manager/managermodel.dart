class ManagerModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String phonenumber;
  final String department;
  final String created_at;
  final String date_of_joining;

  bool isDeleted = false;

  ManagerModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phonenumber,
      required this.department,
      required this.created_at,
      required this.date_of_joining});
}

List<ManagerModel> dummyManagers = [
  ManagerModel(
    id: 1,
    name: "John Doe",
    email: "john.doe@example.com",
    password: "password123",
    phonenumber: "+1234567890",
    department: "HR",
    created_at: "2023-01-15",
    date_of_joining: "2022-05-10",
  ),
  ManagerModel(
    id: 2,
    name: "Jane Smith",
    email: "jane.smith@example.com",
    password: "securepass",
    phonenumber: "+9876543210",
    department: "Finance",
    created_at: "2023-02-20",
    date_of_joining: "2021-11-28",
  ),
  ManagerModel(
    id: 3,
    name: "Robert Johnson",
    email: "robert.johnson@example.com",
    password: "mysecretpassword",
    phonenumber: "+5555555555",
    department: "IT",
    created_at: "2023-03-25",
    date_of_joining: "2020-09-05",
  ),
  // Add more dummy managers here as needed
];
