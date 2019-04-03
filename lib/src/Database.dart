import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'models/User.dart';

class DBProvider {
  
  // Singleton
  DBProvider._();
  static final DBProvider db = DBProvider._();

  // Database instance
  static Database _database;
  
  // Get 
  Future<Database> get database async {
    if (_database != null)
    return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  // Inicialización de la base de datos
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 2, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      // Creación de las tablas
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY,"
          "username TEXT,"
          "password TEXT"
          ")");
    });
  }

  createUser(User newUser) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM User");
    int id = table.first["id"];
    newUser.id = id;
    //insert to the table using the new id 
    var raw = await db.rawInsert(
        "INSERT Into User (id,username,password)"
        " VALUES (?,?,?)",
        [id, newUser.username, newUser.password]);
    return raw;
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    var res = await db.query("User");
    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];
    return list;
  }

  getClient(int id) async {
    final db = await database;
    var res =await  db.query("Client", where: "id = ?", whereArgs: [id]);
    

    return res.isNotEmpty ? User.fromJson(res.first) : Null ;
  }
  getFirstClient() async {
    final db =await database;
    var res = await  db.query("Client");
    return res.isNotEmpty ? User.fromJson(res.first) : Null ;
  }
  getLastClient() async {
    final db =await database;
    var res = await  db.query("Client");
    return res.isNotEmpty ? User.fromJson(res.last) : Null ;
  }
}

