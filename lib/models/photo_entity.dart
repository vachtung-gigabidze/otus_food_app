class Photo {
  late int id;
  late String photoName;
  late int recipeId;
  late String detectedInfo;

  Photo(this.id, this.photoName, this.recipeId, this.detectedInfo);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      // 'id': id,
      'photo_name': photoName,
      'recipe_id': recipeId,
      'detected_info': detectedInfo,
    };
    return map;
  }

  Photo.fromMap(Map<String, dynamic> map) {
    id = map['rowid'];
    photoName = map['photo_name'];
    recipeId = map['recipe_id'];
    detectedInfo = map['detected_info'];
  }
}
