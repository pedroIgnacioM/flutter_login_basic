import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      // Creación de las tablas
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY,"
          "username TEXT,"
          "password TEXT,"
          ")");
    });
  }

}

