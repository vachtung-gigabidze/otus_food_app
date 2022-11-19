class Photo {
  late int id;
  late String photo_name;
  late int recipe_id;
  late String detected_info;

  Photo(this.id, this.photo_name, this.recipe_id, this.detected_info);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photo_name': photo_name,
      'recipe_id': recipe_id,
      'detected_info': detected_info,
    };
    return map;
  }

  Photo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photo_name = map['photo_name'];
    recipe_id = map['recipe_id'];
    detected_info = map['detected_info'];
  }
}
