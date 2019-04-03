import 'dart:convert';

User userFromJson(String str) {
    final jsonData = json.decode(str);
    return User.fromJson(jsonData);
}

String userToJson(User data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class User{
  int id = 0;
  String _username;
  String _password;

  String get username => _username;
  String get password => _password;

  User(String username, String password, {id:0}){
    this._username = username;
    this._password = password;
    this.id = id;
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
      json["username"],
      json["password"],
      id: json["id"]
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "username": _username,
      "password": _password,
  };
}