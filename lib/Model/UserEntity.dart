class UserEntity {
  String name, surname, mail, password;
  String idUtente;

  UserEntity(
      {required this.name,
      required this.surname,
      required this.idUtente,
      required this.password,
      required this.mail});
  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
      idUtente: json["_id"],
      name: json["name"],
      surname: json["surname"],
      mail: json["mail"],
      password: json["password"]);
}
