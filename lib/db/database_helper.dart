// Responsible for database operations

import 'dart:io';

import 'package:kiu_sqlite/models/student.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // database
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // private
  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/kiu.db';

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE tbl_student (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT,
                  course TEXT UNIQUE,
                  mobile TEXT,
                  totalFee INTEGER,
                  feePaid INTEGER
                   );
        ''');
  }

  // return data type
  // saveStudent
  // parameter -
  Future<int> saveStudent(Student s) async {
    Database db = await database;

    int result = await db.rawInsert('''INSERT into tbl_student 
      (name, course, mobile, totalFee, feePaid)
      VALUES ( ?, ?, ?, ?, ?)
    
    ''', [s.name, s.course, s.mobile, s.totalFee, s.feePaid]);

    return result;
  }
}