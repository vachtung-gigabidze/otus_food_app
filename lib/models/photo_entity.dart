import 'dart:typed_data';

class Photo {
  late int id;
  late String photoName;
  late int recipeId;
  late String detectedInfo;
  late Uint8List pict;

  Photo(this.id, this.photoName, this.recipeId, this.detectedInfo, this.pict);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      // 'id': id,
      'photo_name': photoName,
      'recipe_id': recipeId,
      'detected_info': detectedInfo,
      'pict': pict,
    };
    return map;
  }

  Photo.fromMap(Map<String, dynamic> map) {
    id = map['rowid'];
    photoName = map['photo_name'];
    recipeId = map['recipe_id'];
    detectedInfo = map['detected_info'];
    pict = map['pict'];
  }
}
