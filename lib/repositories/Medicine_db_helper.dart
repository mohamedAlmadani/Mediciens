import 'dart:io';

import 'package:Medicines/model/medicine_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MedicineDbHelper {
  MedicineDbHelper._();
  static MedicineDbHelper medicineDbHelper = MedicineDbHelper._();
  static final String databaseName = "medicineDat.db";
  static final String tableName = "medicines";
  static final String medicineIdColumnName = "medicineId";
  static final String medicineNameColumnName = "Name";
  static final String medicineAmountColumnName = "Amount";
  static final String medicineTypeColumnName = "Type";
  static final String medicineWeeksColumnName = "weeks";
  static final String medicineMedicineFormColumnName = "MedicineForm";
  static final String medicineTimeColumnName = "Time";
  static final String medicineDateColumnName = "date";

  Database database;
  initializeTasksDatabase() async {
    if (database == null) {
      database = await connectToTasksDatabase();
    }
  }

  Future<Database> connectToTasksDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = join(directory.path, databaseName);
    Database database =
        await openDatabase(databasePath, version: 2, onCreate: (db, version) {
      createTasksTable(db);
    });
    return database;
  }

  createTasksTable(Database database) {
    database.execute('''CREATE TABLE $tableName(
$medicineIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
$medicineNameColumnName TEXT ,
$medicineAmountColumnName INTEGER ,
$medicineTypeColumnName TEXT,
$medicineWeeksColumnName INTEGER ,
$medicineMedicineFormColumnName TEXT ,
$medicineTimeColumnName INTEGER,
$medicineDateColumnName TEXT 







)''');
  }
  insertNewPills(Medicine medicine) async {
    try {
      int rowNumber = await database.insert(tableName, medicine.toMap());
      print(rowNumber);
    } on Exception catch (e) {
      print(e);
    }
  }
  Future<List<Map<String, dynamic>>> selectAllPills() async {
    try {
      List<Map<String, dynamic>> allRows = await database.query(tableName);
      return allRows;
    } on Exception catch (e) {
      print(e);
    }
  }
  getOnePill(int medicineId) async {
    try {
      List<Map<String, dynamic>> result = await database
          .query(tableName, where: '$medicineIdColumnName=?', whereArgs: [medicineId]);
    } on Exception catch (e) {
      // TODO
    }
  }
  updatePill(Medicine medicine) async {
    database.update(tableName, medicine.toMap(),
        where: '$medicineIdColumnName=?', whereArgs: [medicine.medicineId]);

  }
  deletePill(int medicineId) async {
    database
        .delete(tableName, where: '$medicineIdColumnName=?', whereArgs: [medicineId]);
  }
  deleteAllPills() async {
    database.delete(tableName);
  }
}
