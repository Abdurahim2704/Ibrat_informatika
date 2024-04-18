import 'package:ibrat_informatika/data/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

sealed class DBService {
  static const name = "result.db";
  static late Database db;
  static const tableName = "TestResults";
  static const sqlQuery = """CREATE TABLE IF NOT EXISTS TestResults (
  id integer primary key autoincrement,
  dateTime DATETIME NOT NULL,
  accuracy float NOT NULL,
  questions text NOT NULL,
  answers text NOT NULL,
  image text,
  title text NOT NULL,
  userAnswers text NOT NULL
);""";

  static Future<void> open() async {
    final path = await getDatabasesPath();
    db = await openDatabase(
      join(path, name),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(sqlQuery);
      },
    );
  }

  static Future<TestResults> insert(TestResults results) async {
    final id = await db.insert(tableName, results.toSql());
    results.id = id;
    return results;
  }

  static Future<List<TestResults>> getLatestResults() async {
    final results = (await db
            .rawQuery("SELECT * FROM TestResults ORDER BY id DESC LIMIT 5"))
        .map(TestResults.fromSql)
        .toList();
    print("$results   sallomojhjgdfjhgjkhagjghfd");
    return results;
  }
}
