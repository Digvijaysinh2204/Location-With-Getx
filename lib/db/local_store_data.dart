import 'package:location/model/location_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  static const String tableAirport = 'airport';
  static const String columnIcao = 'icao';
  static const String columnIata = 'iata';
  static const String columnName = 'name';
  static const String columnCity = 'city';
  static const String columnState = 'state';
  static const String columnCountry = 'country';
  static const String columnElevation = 'elevation';
  static const String columnLat = 'lat';
  static const String columnLon = 'lon';
  static const String columnTz = 'tz';

  DatabaseHelper._();

  factory DatabaseHelper() {
    return instance;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'airport.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
            CREATE TABLE $tableAirport (
              $columnIcao TEXT PRIMARY KEY,
              $columnIata TEXT,
              $columnName TEXT,
              $columnCity TEXT,
              $columnState TEXT,
              $columnCountry TEXT,
              $columnElevation INTEGER,
              $columnLat REAL,
              $columnLon REAL,
              $columnTz TEXT
              )
            ''');
  }

  Future<void> insertAirport(AirportModel airport) async {
    final db = await database;

    await db!.insert(
      tableAirport,
      airport.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<AirportModel>> getAirports() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db!.query(tableAirport);

    return List.generate(maps.length, (i) {
      return AirportModel.fromJson(maps[i]);
    });
  }

  Future<void> updateAirport(AirportModel airport) async {
    final db = await database;

    await db!.update(
      tableAirport,
      airport.toJson(),
      where: '$columnIcao = ?',
      whereArgs: [airport.icao],
    );
  }

  Future<void> deleteAirport(String icao) async {
    final db = await database;

    await db!.delete(
      tableAirport,
      where: '$columnIcao = ?',
      whereArgs: [icao],
    );
  }
}
