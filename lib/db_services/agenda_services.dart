import 'package:agenda_cancha_app/db_services/db_services.dart';
import 'package:agenda_cancha_app/models/agenda.dart';
import 'package:sqflite/sqflite.dart';

class AgendaServices {
  static const String tableName = 'Agenda';

  static Future<List<Agenda>> getAgendas() async {
    var con = await DbServices.openConnection();
    List<Agenda> list = [];
    try {
      List result = await con.query(tableName);
      list = List<Agenda>.from(result.map((model) => Agenda.fromJson(model)));
    } on Exception catch (_) {
      //print(_);
    }
    return list;
  }

  static Future<List<Agenda>> validAgenda(Agenda model) async {
    var con = await DbServices.openConnection();
    List<Agenda> list = [];
    try {
      List result = await con.query(
        tableName,
        where: 'canchaId = ? and date(fecha) = date(?)',
        whereArgs: [model.canchaId, model.fecha],
      );
      list = List<Agenda>.from(result.map((model) => Agenda.fromJson(model)));
    } on DatabaseException catch (_) {
      //print(_);
    }
    return list;
  }

  static Future<int> insert(Agenda model) async {
    var con = await DbServices.openConnection();
    int result = 0;
    try {
      result = await con.insert(tableName, model.toJson());
    } on Exception catch (_) {
      //print(_);
    }
    return result;
  }

  static Future<int> delete(int id) async {
    var con = await DbServices.openConnection();
    int result = 0;
    try {
      result = await con.delete(tableName, where: 'id = ?', whereArgs: [id]);
    } on Exception catch (_) {
      //print(_);
    }
    return result;
  }
}
