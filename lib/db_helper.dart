import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'chat_app.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE messages(
        id TEXT PRIMARY KEY,
        content TEXT,
        imageUrl TEXT,
        fileUrl TEXT,
        timestamp TEXT,
        isSynced INTEGER
      )
    ''');
  }

  Future<int> insertMessage(Map<String, dynamic> message) async {
    final db = await database;
    return await db.insert('messages', message);
  }

  Future<List<Map<String, dynamic>>> getUnsyncedMessages() async {
    final db = await database;
    return await db.query('messages', where: 'isSynced = ?', whereArgs: [0]);
  }

  Future<int> updateMessage(String id, Map<String, dynamic> message) async {
    final db = await database;
    return await db
        .update('messages', message, where: 'id = ?', whereArgs: [id]);
  }
}
