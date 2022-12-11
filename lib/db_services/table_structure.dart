class TableStructure {
  static String agendaTable = '''

create table Agenda (
id INTEGER PRIMARY KEY AUTOINCREMENT,
canchaId INTEGER not null,
fecha TEXT not null,
nombre TEXT not null,
apellido TEXT not null,
clima TEXT not null
);
''';
}
