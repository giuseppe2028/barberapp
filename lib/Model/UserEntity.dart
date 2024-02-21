class UserEntity {
  String name, surname, mail, password;
  int idUtente;

  UserEntity(
      {required this.name,
      required this.surname,
      required this.idUtente,
      required this.password,
      required this.mail});
}
