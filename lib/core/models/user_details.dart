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
    this.account,
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
  Account? account;
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
    account: Account.fromJson(json["account"]),
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
    userType: json["userType"],
    phonenumber: json["phonenumber"],
    verified: json["verified"]  == 1 ? true : false,
    dependantCode: json["dependantCode"],
    //dependants: List<dynamic>.from(json["dependants"].map((x) => x)),
    //guardians: List<dynamic>.from(json["guardians"].map((x) => x)),
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
    "account": account!.toJson(),
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
    "userType": userType,
    "phonenumber": phonenumber,
    "verified": verified! ?1:0,
    "dependantCode": dependantCode,
    //"dependants": dependants.toString(),
    //"guardians": guardians.toString(),
    "id": id,
    "uniqueId": uniqueId,
    "dateCreated": dateCreated!.toIso8601String(),
    "dateModified": dateModified!.toIso8601String(),
  };
}
class Account {
  Account({
    required this.userId,
    this.name,
    required this.ledgerBalance,
    this.number,
    required this.accountStatus,
    required this.accountType,
    required this.accountCategory,
    required this.id,
    required this.uniqueId,
    required this.dateCreated,
    required this.dateModified,
  });

  dynamic userId;
  String? name;
  double? ledgerBalance;
  dynamic number;
  String accountStatus;
  String accountType;
  String accountCategory;
  dynamic id;
  String uniqueId;
  DateTime dateCreated;
  DateTime dateModified;

  factory Account.fromJson(Map<String, dynamic> json) =>
      Account(
        userId: json["userId"],
        name: json["name"],
        ledgerBalance: json["ledgerBalance"],
        number: json["number"],
        accountStatus: json["accountStatus"],
        accountType: json["accountType"],
        accountCategory: json["accountCategory"],
        id: json["id"],
        uniqueId: json["uniqueId"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: DateTime.parse(json["dateModified"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "userId": userId,
        "name": name,
        "ledgerBalance": ledgerBalance,
        "number": number,
        "accountStatus": accountStatus,
        "accountType": accountType,
        "accountCategory": accountCategory,
        "id": id,
        "uniqueId": uniqueId,
        "dateCreated": dateCreated.toIso8601String(),
        "dateModified": dateModified.toIso8601String(),
      };
}
