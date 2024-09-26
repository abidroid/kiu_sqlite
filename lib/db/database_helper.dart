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
                  name TEXT NOT NULL,
                  course TEXT,
                  mobile TEXT UNIQUE,
                  totalFee INTEGER,
                  feePaid INTEGER
                   );
        ''');
  }

  // return data type
  // saveStudent
  // parameter -
  Future<int> saveStudent(Student s) async {
    Database db = await instance.database;

    // int result = await db.rawInsert('''INSERT into tbl_student
    //   (name, course, mobile, totalFee, feePaid)
    //   VALUES ( ?, ?, ?, ?, ?)
    //   ''', [s.name, s.course, s.mobile, s.totalFee, s.feePaid]);
    //
    //

    int result = await db.insert('tbl_student', s.toMap());

    return result;
  }

  Future<List<Map<String, dynamic>>> getAllStudents() async {
    List<Student> studentList = [];

    // access db and get all student records
    Database db = await instance.database;

    List<Map<String, dynamic>> studentsMap =
        await db.rawQuery('SELECT * from tbl_student');

    //await Future.delayed(const Duration(seconds: 3));
    return studentsMap;
  }

  Future<int> deleteStudent(int id) async {
    Database db = await instance.database;

    int result = await db.rawDelete('DELETE from tbl_student where id=?', [id]);

    return result;
  }

  Future<int> updateStudent(Student s) async {
    Database db = await instance.database;

    int result = await db.update(
      'tbl_student',
      s.toMap(),
      where: 'id=?',
      whereArgs: [s.id],
    );

    return result;
  }
}
