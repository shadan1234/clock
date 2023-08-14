import 'package:clock_app/alarm/set_of_time.dart';
import 'package:clock_app/alarm/timing_set.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common/utils/utils.dart' as utils;
class DatabaseHandler {
  static final DatabaseHandler _instance = DatabaseHandler._internal();

  factory DatabaseHandler() => _instance;

  Database? _database;

  DatabaseHandler._internal();

  Future<Database> openDB() async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase('clock.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filepath) async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(databasesPath, filepath);

    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {

    await db.execute('''
      CREATE TABLE set_of_times(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        hour INTEGER,
        minute INTEGER,
        am_pm TEXT,
        button TEXT,
        font INTEGER,
        path TEXT
      )
    ''');
  }

  Future<void> saveToDatabase(Set_of_time time) async {
    final db = await DatabaseHandler().openDB();
    print('data saving in process');


    await db.insert(
      'set_of_times',
      time.toJson(),  // Convert to JSON before inserting
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );


    print('Data stored in the database');
  }



  Future<List<Set_of_time>?> fetchFromDatabase() async {
    final db = await _instance.openDB();

    if (db != null) {
      final List<Map<String, dynamic>>? maps = await db.query('set_of_times');

      print('data fetched');
        return maps?.map((map) => Set_of_time.fromJson(map)).toList();


     // Notify listeners after populating the list
    }
  }
  Future<int> updateSetOfTime(int index, Set_of_time setTime) async {
    int id1=setTime.id!;
    final db = await _instance.openDB();


    final rowsUpdated= db.update(
      'set_of_times',
      {
        'hour': setTime.hour,
        'minute': setTime.minute,
        'am_pm': setTime.am_pm,
        'button': setTime.button,
        'font': setTime.font ? 1 : 0,
        'path': setTime.path,
      },

      where: '?',
      whereArgs: [id1],
    );

    print('data updated');
    return rowsUpdated;
  }
  Future<int> toggling(int index, Set_of_time setTime) async {
    int id1=setTime.id!;
    final db = await _instance.openDB();


    final rowsUpdated= db.update(
      'set_of_times',
      {
        'hour': setTime.hour,
        'minute': setTime.minute,
        'am_pm': setTime.am_pm,
        'button': setTime.button,
        'font': setTime.font ? 1 : 0,
        'path': setTime.path,
      },

      where: '?',
      whereArgs: [id1],
    );

    print('data updated');
    return rowsUpdated;
  }
  Future<int> deleteAlarm(int id) async {
    final db = await _instance.openDB();

    print('deleted');
    return await db.delete(
      'set_of_times',
      where: '?',
      whereArgs: [id],
    );
  }

  Future<void> closeDatabase() async {
    final db = await DatabaseHandler().openDB();

  }
}

