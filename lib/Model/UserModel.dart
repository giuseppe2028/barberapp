class UserModel {
  String name;
  String surname;
  String mail;
  String password;
  int id;
  UserModel(
      {required this.id,
      required this.name,
      required this.surname,
      required this.mail,
      required this.password});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["idUtente"],
      name: json["name"],
      surname: json["surname"],
      mail: json["mail"],
      password: json["password"]);
}
