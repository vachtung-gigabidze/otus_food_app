import 'dart:async';
import 'dart:io' as io;

import 'package:otus_food_app/models/Photo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'photo_name';
  static const String RECIPE_ID = 'recipe_id';
  static const String TABLE = 'RecipesPhoto';
  static const String DB_NAME = 'photos.db';

  Future<Database> get db async {
    if (null != _db) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT, $RECIPE_ID INTEGER)");
  }

  Future<Photo> save(Photo photo) async {
    var dbClient = await db;
    photo.id = await dbClient.insert(TABLE, photo.toMap());
    return photo;
  }

  Future<List<Photo>> getPhotos(int recipeId) async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query(TABLE,
        columns: [ID, NAME, RECIPE_ID], where: '$RECIPE_ID = $recipeId');
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
