import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'cashflowdata.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Create tables if they don't exist
        db.execute('''
          CREATE TABLE IF NOT EXISTS transactions (
            id INTEGER PRIMARY KEY,
            date TEXT,
            amount REAL,
            description TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertTransaction(Map<String, dynamic> transaction) async {
    return await _database.insert('transactions', transaction);
  }

  Future<List<Map<String, dynamic>>> getAllTransactions() async {
    return await _database.query('transactions');
  }

  // Add other database operations as needed
}
