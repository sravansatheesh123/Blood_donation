import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  late Database _database;

  Future<void> openDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), "dnnr.db"),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE donnertable(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age TEXT, ph TEXT, email TEXT, bgrup TEXT)",
        );
      },
    );
  }

  Future<int> insertDonner(Donner dnnr) async {
    await openDB();
    return await _database.insert('donnertable', dnnr.toMap());
  }

  Future<List<Donner>> getDonnerList() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _database.query('donnertable');
    return List.generate(
      maps.length,
          (index) {
        return Donner(
          id: maps[index]['id'],
          name: maps[index]['name'],
          age: maps[index]['age'],
          email: maps[index]['email'] ?? '',
          ph: maps[index]['ph'] ?? '',
          bgrup: maps[index]['bgrup'] ?? '',
        );
      },
    );
  }



  Future<int> updatedonner(Donner donner) async {
    await openDB();
    return await _database.update('donnertable', donner.toMap(),
        where: 'id=?', whereArgs: [donner.id]);
  }

  Future<void> deletedonner(int? id) async {
    await openDB();
    await _database.delete("donnertable", where: "id = ?", whereArgs: [id]);
  }
}

class Donner {
  int? id;
  String name;
  String age;
  String ph;
  String email;
  String bgrup;

  Donner({
    this.id,
    required this.name,
    required this.age,
    required this.ph,
    required this.email,
    required this.bgrup,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'ph': ph,
      'email': email,
      'bgrup': bgrup,
    };
  }
}