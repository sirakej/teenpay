class CreateUser {
  CreateUser({
    this.username,
    this.firstname,
    this.lastname,
    this.gender,
    this.email,
    this.userType,
    this.phonenumber,
    this.password,
    this.guardianId,
  });

  String? username;
  String? firstname;
  String? lastname;
  String? gender;
  String? email;
  String? userType;
  String? phonenumber;
  String? password;
  int? guardianId;

  factory CreateUser.fromJson(Map<String, dynamic> json) => CreateUser(
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    gender: json["gender"],
    email: json["email"],
    userType: json["userType"],
    phonenumber: json["phonenumber"],
    password: json["password"],
    guardianId: json["guardianId"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "email": email,
    "userType": userType,
    "phonenumber": phonenumber,
    "password": password,
    "guardianId": guardianId,
  };
}
