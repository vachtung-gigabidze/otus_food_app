class Photo {
  late int id;
  late String photo_name;
  late int recipe_id;

  Photo(this.id, this.photo_name, this.recipe_id);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photo_name': photo_name,
      'recipe_id': recipe_id,
    };
    return map;
  }

  Photo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photo_name = map['photo_name'];
    recipe_id = map['recipe_id'];
  }
}
