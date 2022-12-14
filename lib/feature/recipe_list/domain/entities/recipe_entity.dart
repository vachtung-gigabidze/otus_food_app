class Recipe {
  int? id;
  bool? isCooking;
  String? name;
  int? duration;
  String? photo;
  List<RecipeIngredient>? recipeIngredients;
  List<RecipeStepLink>? recipeStepLinks;
  List<Favorite>? favoriteRecipes;
  List<Comment>? comments;

  Recipe({this.id, this.name, this.duration, this.photo});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    photo = json['photo'];

    if (json['recipeIngredients'] != null) {
      recipeIngredients = <RecipeIngredient>[];
      json['recipeIngredients'].forEach((v) {
        recipeIngredients!.add(RecipeIngredient.fromJson(v));
      });
    }

    if (json['recipeStepLinks'] != null) {
      recipeStepLinks = <RecipeStepLink>[];
      json['recipeStepLinks'].forEach((v) {
        recipeStepLinks!.add(RecipeStepLink.fromJson(v));
      });
    }
    if (json['favoriteRecipes'] != null) {
      favoriteRecipes = <Favorite>[];
      json['favoriteRecipes'].forEach((v) {
        favoriteRecipes!.add(Favorite.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comment>[];
      json['comments'].forEach((v) {
        comments!.add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['duration'] = duration;
    data['photo'] = photo;

    if (recipeIngredients != null) {
      data['recipeIngredients'] =
          recipeIngredients!.map((v) => v.toJson()).toList();
    }

    if (recipeStepLinks != null) {
      data['recipeStepLinks'] =
          recipeStepLinks!.map((v) => v.toJson()).toList();
    }

    if (favoriteRecipes != null) {
      data['favoriteRecipes'] =
          favoriteRecipes!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  void updateCookingSteps() {
    if (recipeStepLinks!.isEmpty) {
      return;
    }
    recipeStepLinks![0].status = (isCooking ?? false)
        ? CookingStepsStatus.passed
        : CookingStepsStatus.notStarted;
    for (int i = 1; i < recipeStepLinks!.length; i++) {
      recipeStepLinks![i].status = (isCooking ?? false)
          ? CookingStepsStatus.notPassed
          : CookingStepsStatus.notStarted;
    }
  }

  bool changeFavorite(bool prevFavorite, String username) {
    if (prevFavorite) {
      removeFavorite(username);
    } else {
      addFavorite(username);
    }
    return !prevFavorite;
  }

  bool isFavorite(int userId) {
    return favoriteRecipes!.any((element) => element.user?.id == userId);
  }

  void addFavorite(String username) {
    favoriteRecipes!.add(Favorite(user: null));
  }

  void removeFavorite(String username) {
    favoriteRecipes!.remove(Favorite(user: null));
  }

  int findFavorite({required int userId}) {
    return favoriteRecipes?.firstWhere((f) => f.user?.id == userId).id ?? 0;
  }
}

class RecipeIngredient {
  int? id;
  double? count;
  Ingredient? ingredient;
  Recipe? recipe;

  RecipeIngredient({this.id, this.count, this.ingredient, this.recipe});

  RecipeIngredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'] + .0;
    ingredient = json['ingredient'] != null
        ? Ingredient.fromJson(json['ingredient'])
        : null;
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    if (ingredient != null) {
      data['ingredient'] = ingredient!.toJson();
    }
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    return data;
  }

  String showQuantity() {
    if (count == 0) {
      return 'по вкусу';
    }

    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

    String s = count.toString().replaceAll(regex, '');

    if (count! > 4) {
      return '$s ${ingredient?.measureUnit?.many}';
    }
    if (count! == 1) {
      return '$s ${ingredient?.measureUnit?.one}';
    }
    return '$s ${ingredient?.measureUnit?.few}';
  }
}

class RecipeStep {
  int? id;
  String? name;
  int? duration;

  RecipeStep({this.id, this.name, this.duration});

  RecipeStep.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['duration'] = duration;
    return data;
  }
}

enum CookingStepsStatus {
  passed,
  notPassed,
  notStarted,
}

class RecipeStepLink {
  int? id;
  int? number;
  Recipe? recipe;
  RecipeStep? step;
  CookingStepsStatus? status;

  RecipeStepLink(
      {this.id,
      this.number,
      this.recipe,
      this.step,
      this.status = CookingStepsStatus.notStarted});

  RecipeStepLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
    step = json['step'] != null ? RecipeStep.fromJson(json['step']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    if (step != null) {
      data['step'] = step!.toJson();
    }
    return data;
  }
}

class MeasureUnit {
  int? id;
  String? one;
  String? few;
  String? many;

  MeasureUnit({this.id, this.one, this.few, this.many});

  MeasureUnit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    one = json['one'];
    few = json['few'];
    many = json['many'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['one'] = one;
    data['few'] = few;
    data['many'] = many;
    return data;
  }
}

class Ingredient {
  int? id;
  String? name;
  MeasureUnit? measureUnit;

  Ingredient({this.id, this.name, this.measureUnit});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    measureUnit = json['measureUnit'] != null
        ? MeasureUnit.fromJson(json['measureUnit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (measureUnit != null) {
      data['measureUnit'] = measureUnit!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? login;
  String? photo;

  User({this.id, this.login, this.photo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['username'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = login;
    data['photo'] = photo;

    return data;
  }
}

class Favorite {
  int? id;
  Recipe? recipe;
  User? user;

  Favorite({this.id, this.recipe, this.user});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Comment {
  int? id;
  String? text;
  String? photo;
  String? datetime;
  User? user;

  Comment({this.id, this.text, this.photo, this.datetime, this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    photo = json['photo'];
    datetime = json['datetime'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['photo'] = photo;
    data['datetime'] = datetime;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
