import 'package:agenda_cancha_app/db_services/table_structure.dart';
import 'package:sqflite/sqflite.dart';

class DbServices {
  static const String dbName = 'Agenda.db';

  static Future<String> getPathDb() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + dbName;
    return Future.value(path);
  }

  static Future<Database> openConnection() async {
    String path = await getPathDb();
    return await openDatabase(path, version: 1);
  }

  static Future<void> initialDb() async {
    String path = await getPathDb();

    await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(TableStructure.agendaTable);
    });
  }
}
