class UserModel {
  String? id;
  String? email;
  String? fullName;

  UserModel({
    this.id,
    this.email,
    this.fullName,
  });

  // from json
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        fullName: json["fullname"],
      );

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullname': fullName,
    };
  }
}
