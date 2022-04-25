import 'dart:async';
import 'dart:developer';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stripling_wallet/core/models/user_details.dart';
/// This creates and controls a sqlite database for the logged in user's details
class DatabaseHelper {
  /// Instantiating this class to make it a singleton
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  /// Instantiating database from the sqflite package
  static Database? _db;
  /// A string value to hold the name of the table in the database
  // ignore: non_constant_identifier_names
  final String USER_TABLET = 'Far';
  /// A function to get the database [_db] if it exists or wait to initialize
  /// a new database by calling [initDb()] and return [_db]
  Future<Database> get db async {
    if(_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }
  DatabaseHelper.internal();
  /// Creating a new database in the device located in [path] with the
  /// [_onCreate()] function to create its table and fields
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'Far.db');
    var theDb = await openDatabase(path, version:4, onCreate: _onCreate,);
    return theDb;
  }
  /// UPGRADE DATABASE TABLES
  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    //*if (oldVersion < newVersion) {
      db.execute('ALTER TABLE $USER_TABLET ADD COLUMN api_token TEXT NOT NULL;');
    }//*

  /// Function to execute sqlite statement to create a new table and its fields
  void _onCreate(Database db, int version) async{
    // When creating the db, create the table
    await db.execute('CREATE TABLE $USER_TABLET('
        'username TEXT PRIMARY KEY NOT NULL,'
        'firstname TEXT NOT NULL,'
        'lastname TEXT NOT NULL,'
        'gender TEXT NOT NULL,'
        'email TEXT NOT NULL,'
        'userStatus TEXT NOT NULL,'
        'userType TEXT NOT NULL,'
        'phonenumber TEXT NULL,'
        'verified TEXT NOT NULL,'
        'dependantCode TEXT NOT NULL,'
        'dependants TEXT NOT NULL,'
        'guardians TEXT NOT NULL,'
        'id TEXT NOT NULL,'
        'uniqueId TEXT NOT NULL,'
        'dateCreated TEXT NOT NULL,'
        'dateModified TEXT NOT NULL)'
    );
    log('Created tables');
  }

  /// This function insert user's details into the database records
  Future<int> saveUser(UserDetails user) async {
    var dbClient = await db;
    await dbClient.delete(USER_TABLET);
    int res = await dbClient.insert(USER_TABLET, user.toSQL());
    return res;
  }
  /// This function update user's details in the database records
  Future<int> updateUser(UserDetails user) async {
    var dbClient = await db;
    int res = await dbClient.update(USER_TABLET, user.toSQL());
    return res;
  }
  /// This function get user's details from the database
  Future<UserDetails> getUser() async {
    var dbConnection = await db;
    List<Map<String, dynamic>> users = await dbConnection.rawQuery('SELECT * FROM $USER_TABLET');
    if (users.isNotEmpty) return UserDetails.fromSQL(users[0]);
    throw 'Not authorized, log out and log in to continue';
  }
  /// This function deletes user's details from the database records
  Future<int> deleteUsers() async {
    var dbClient = await db;
    int res = await dbClient.delete(USER_TABLET);
    return res;
  }
  /// This function checks if a user exists in the database by querying the
  /// database to check the length of the records and returns true if it is > 0
  /// or false if it is not
  Future<bool> isLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient.query(USER_TABLET);
    return res.isNotEmpty ? true : false;
  }
}