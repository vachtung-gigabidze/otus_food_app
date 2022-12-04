import 'dart:async';
import 'dart:io' as io;

import 'package:otus_food_app/models/photo_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;
  static const String id = 'id';
  static const String name = 'photo_name';
  static const String recipeId = 'recipe_id';
  static const String detectedInfo = 'detected_info';
  static const String pict = 'pict';
  static const String tableName = 'RecipesPhoto';
  static const String dbName = 'photos.db';

  Future<Database> get db async {
    if (null != _db) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  // $ID integer primary key autoincrement,
  _onCreate(Database db, int version) async {
    await db.execute('''
                    create table $tableName (                      
                      $name text not null,
                      $recipeId integer not null,
                      $detectedInfo text not null,
                      $pict BLOB )
                    ''');
  }

  Future<Photo> save(Photo photo) async {
    var dbClient = await db;

    photo.id = await dbClient.insert(tableName, photo.toMap());
    return photo;
  }

  Future<int> delete(Photo photo) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: "rowid = ?", whereArgs: [photo.id]);
  }

  Future<List<Photo>> getPhotos(int recipeId) async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query(tableName,
        columns: ["rowid", name, DBHelper.recipeId, detectedInfo, pict],
        where: '${DBHelper.recipeId} = $recipeId');
    List<Photo> photos = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        photos.add(Photo.fromMap(maps[i]));
      }
    }
    return photos;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
