import 'package:get/get.dart';
import 'package:medtrack/app_module/prescription_module/model/prescription_model.dart';
import 'package:medtrack/core/utils/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class PrescriptionServices extends GetxService {
  Database? database;
  RxList<PrescriptionModel> drugs = RxList<PrescriptionModel>([]);

  Future<void> initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'medtrack.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE drugs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId TEXT,
            name TEXT,
            dose TEXT,
            time TEXT
          )
        ''');
      },
    );
    await _loadDrugs();
    await getDrugs();
  }

  Future<void> _loadDrugs() async {
    final rawData = await database!.rawQuery('SELECT * FROM drugs WHERE userId = ?', [userUid]);
    drugs.clear();
    drugs.addAll(rawData.map((json) => PrescriptionModel.fromJson(json)));
  }

  Future<List<PrescriptionModel>> getDrugs() async {
    final rawData = await database!.rawQuery('SELECT * FROM drugs WHERE userId = ?', [userUid]);
    return rawData.map((json) => PrescriptionModel.fromJson(json)).toList();
  }

  Future<bool> saveDrug(PrescriptionModel drug) async {
    try {
      await database!.insert('drugs', drug.toJson());
      await _loadDrugs();
      return true;
    } catch (error) {
      print('Error saving drug: $error');
      return false;
    }
  }

  Future<void> deleteDrug(int id) async {
    await database!.delete('drugs', where: 'id = ?', whereArgs: [id]);
    await _loadDrugs();
  }

  Future<void> updateDrug(PrescriptionModel drug) async {
    await database!.update('drugs', drug.toJson(), where: 'id = ?', whereArgs: [drug.id]);
    await _loadDrugs();
  }
}