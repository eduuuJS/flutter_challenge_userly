class User {
  int id;
  String uuid;
  String name;
  String username;
  String email;
  String phone;
  String website;

  User({
    required this.name,
    required this.uuid,
    required this.username,
    required this.id,
    required this.email,
    required this.phone,
    required this.website,
  });

  User clone() => User(
        name: name,
        username: username,
        id: id,
        uuid: uuid,
        email: email,
        phone: phone,
        website: website,
      );
}
