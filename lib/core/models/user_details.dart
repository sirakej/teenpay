class UserDetails {
  UserDetails({
    this.username,
    this.firstname,
    this.lastname,
    this.gender,
    this.email,
    this.userStatus,
    this.userType,
    this.phonenumber,
    this.verified,
    this.dependantCode,
    this.dependants,
    this.guardians,
    this.id,
    this.uniqueId,
    this.dateCreated,
    this.dateModified,
  });

  String? username;
  String? firstname;
  String? lastname;
  String? gender;
  String? email;
  String? userStatus;
  String? userType;
  dynamic phonenumber;
  bool? verified;
  String? dependantCode;
  List<dynamic>? dependants;
  List<dynamic>? guardians;
  int? id;
  String? uniqueId;
  DateTime? dateCreated;
  DateTime? dateModified;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    gender: json["gender"],
    email: json["email"],
    userStatus: json["userStatus"],
    userType: json["userType"],
    phonenumber: json["phonenumber"],
    verified: json["verified"],
    dependantCode: json["dependantCode"],
    dependants: List<dynamic>.from(json["dependants"].map((x) => x)),
    guardians: List<dynamic>.from(json["guardians"].map((x) => x)),
    id: json["id"],
    uniqueId: json["uniqueId"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    dateModified: DateTime.parse(json["dateModified"]),
  );

  factory UserDetails.fromSQL(Map<String, dynamic> json) => UserDetails(
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    gender: json["gender"],
    email: json["email"],
    userStatus: json["userStatus"],
    userType: json["userType"].toString(),
    phonenumber: json["phonenumber"],
    verified: json["verified"],
    dependantCode: json["dependantCode"],
    dependants: List<dynamic>.from(json["dependants"].map((x) => x)),
    guardians: List<dynamic>.from(json["guardians"].map((x) => x)),
    id: json["id"],
    uniqueId: json["uniqueId"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    dateModified: DateTime.parse(json["dateModified"]),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "email": email,
    "userStatus": userStatus,
    "userType": userType,
    "phonenumber": phonenumber,
    "verified": verified,
    "dependantCode": dependantCode,
    "dependants": List<dynamic>.from(dependants!.map((x) => x)),
    "guardians": List<dynamic>.from(guardians!.map((x) => x)),
    "id": id,
    "uniqueId": uniqueId,
    "dateCreated": dateCreated!.toIso8601String(),
    "dateModified": dateModified!.toIso8601String(),
  };

  Map<String, dynamic> toSQL() => {
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "email": email,
    "userStatus": userStatus,
    "userType": userType.toString(),
    "phonenumber": phonenumber,
    "verified": verified,
    "dependantCode": dependantCode,
    "dependants": dependants.toString(),
    "guardians": guardians.toString(),
    "id": id,
    "uniqueId": uniqueId,
    "dateCreated": dateCreated!.toIso8601String(),
    "dateModified": dateModified!.toIso8601String(),
  };
}

