class UserModel {
  String name;
  String surname;
  String mail;
  String password;
  UserModel(
      {required this.name,
      required this.surname,
      required this.mail,
      required this.password});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json["name"],
      surname: json["surname"],
      mail: json["mail"],
      password: json["password"]);
}
