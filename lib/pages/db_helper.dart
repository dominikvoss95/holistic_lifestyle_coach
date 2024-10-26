import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'diary.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE diary_entries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        morning_meal TEXT,
        noon_meal TEXT,
        evening_meal TEXT,
        water TEXT,
        beverages TEXT,
        fats_oils TEXT,
        condiments TEXT,
        exercise TEXT,
        sleep_quality TEXT,
        bowel_movement TEXT
      )
    ''');
  }

  Future<int> insertDiaryEntry(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('diary_entries', data);
  }

  Future<List<Map<String, dynamic>>> getDiaryEntries() async {
    final db = await database;
    return await db.query('diary_entries', orderBy: 'date');
  }

  Future<int> updateDiaryEntry(int id, Map<String, dynamic> data) async {
    final db = await database;
    return await db.update(
      'diary_entries',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteDiaryEntry(int id) async {
    final db = await database;
    return await db.delete(
      'diary_entries',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
