class RecipeModel {
  List<Recipe>? recipes;
  List<RecipeIngredient>? recipeIngredient;
  List<RecipeStep>? recipeStep;
  List<RecipeStepLink>? recipeStepLink;
  List<MeasureUnit>? measureUnits;
  List<Ingredient>? ingredient;
  List<Freezer>? freezer;
  List<User>? users;
  List<Favorite>? favorites;
  List<Comment>? comments;

  RecipeModel(
      {this.recipes,
      this.recipeIngredient,
      this.recipeStep,
      this.recipeStepLink,
      this.measureUnits,
      this.ingredient,
      this.freezer,
      this.users,
      this.favorites,
      this.comments});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    if (json['Recipes'] != null) {
      recipes = <Recipe>[];
      json['Recipes'].forEach((v) {
        recipes!.add(Recipe.fromJson(v));
      });
    }
    if (json['RecipeIngredient'] != null) {
      recipeIngredient = <RecipeIngredient>[];
      json['RecipeIngredient'].forEach((v) {
        recipeIngredient!.add(RecipeIngredient.fromJson(v));
      });
    }
    if (json['RecipeStep'] != null) {
      recipeStep = <RecipeStep>[];
      json['RecipeStep'].forEach((v) {
        recipeStep!.add(RecipeStep.fromJson(v));
      });
    }
    if (json['RecipeStepLink'] != null) {
      recipeStepLink = <RecipeStepLink>[];
      json['RecipeStepLink'].forEach((v) {
        recipeStepLink!.add(RecipeStepLink.fromJson(v));
      });
    }
    if (json['MeasureUnit'] != null) {
      measureUnits = <MeasureUnit>[];
      json['MeasureUnit'].forEach((v) {
        measureUnits!.add(MeasureUnit.fromJson(v));
      });
    }
    if (json['Ingredient'] != null) {
      ingredient = <Ingredient>[];
      json['Ingredient'].forEach((v) {
        ingredient!.add(Ingredient.fromJson(v));
      });
    }
    if (json['Freezer'] != null) {
      freezer = <Freezer>[];
      json['Freezer'].forEach((v) {
        freezer!.add(Freezer.fromJson(v));
      });
    }
    if (json['User'] != null) {
      users = <User>[];
      json['User'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
    if (json['Favorite'] != null) {
      favorites = <Favorite>[];
      json['Favorite'].forEach((v) {
        favorites!.add(Favorite.fromJson(v));
      });
    }
    if (json['Comment'] != null) {
      comments = <Comment>[];
      json['Comment'].forEach((v) {
        comments!.add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.recipes != null) {
      data['Recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    if (this.recipeIngredient != null) {
      data['RecipeIngredients'] =
          this.recipeIngredient!.map((v) => v.toJson()).toList();
    }
    if (this.recipeStep != null) {
      data['RecipeSteps'] = this.recipeStep!.map((v) => v.toJson()).toList();
    }
    if (this.recipeStepLink != null) {
      data['RecipeStepLink'] =
          this.recipeStepLink!.map((v) => v.toJson()).toList();
    }
    if (this.measureUnits != null) {
      data['MeasureUnits'] = this.measureUnits!.map((v) => v.toJson()).toList();
    }
    if (this.ingredient != null) {
      data['Ingredient'] = this.ingredient!.map((v) => v.toJson()).toList();
    }
    if (this.freezer != null) {
      data['Freezer'] = this.freezer!.map((v) => v.toJson()).toList();
    }
    if (this.users != null) {
      data['Users'] = this.users!.map((v) => v.toJson()).toList();
    }
    if (this.favorites != null) {
      data['Favorites'] = this.favorites!.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['Comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipe {
  int? id;
  String? name;
  int? duration;
  String? photo;

  Recipe({this.id, this.name, this.duration, this.photo});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['photo'] = this.photo;
    return data;
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
    count = json['count'];
    ingredient = json['ingredient'] != null
        ? Ingredient.fromJson(json['ingredient'])
        : null;
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    if (this.ingredient != null) {
      data['ingredient'] = this.ingredient!.toJson();
    }
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.toJson();
    }
    return data;
  }
}

class Ingredient {
  int? id;

  Ingredient({this.id});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    return data;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    return data;
  }
}

class RecipeStepLink {
  int? id;
  int? number;
  Recipe? recipe;
  RecipeStepLink? step;

  RecipeStepLink({this.id, this.number, this.recipe, this.step});

  RecipeStepLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
    step = json['step'] != null ? RecipeStepLink.fromJson(json['step']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.toJson();
    }
    if (this.step != null) {
      data['step'] = this.step!.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['one'] = this.one;
    data['few'] = this.few;
    data['many'] = this.many;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.measureUnit != null) {
      data['measureUnit'] = this.measureUnit!.toJson();
    }
    return data;
  }
}

class Freezer {
  int? id;
  int? count;
  User? user;
  Ingredient? ingredient;

  Freezer({this.id, this.count, this.user, this.ingredient});

  Freezer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    ingredient = json['ingredient'] != null
        ? Ingredient.fromJson(json['ingredient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.ingredient != null) {
      data['ingredient'] = this.ingredient!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? login;
  String? photo;
  String? password;
  String? token;

  User({this.id, this.login, this.photo, this.password, this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    photo = json['photo'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['photo'] = this.photo;
    data['password'] = this.password;
    data['token'] = this.token;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['photo'] = this.photo;
    data['datetime'] = this.datetime;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
