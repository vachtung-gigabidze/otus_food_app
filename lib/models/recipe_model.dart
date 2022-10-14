class RecipeModel {
  List<Recipes>? recipes;
  List<RecipeIngredients>? recipeIngredients;
  List<RecipeSteps>? recipeSteps;
  List<RecipeStepLink>? recipeStepLink;
  List<MeasureUnits>? measureUnits;
  List<Ingredient>? ingredient;
  List<Freezer>? freezer;
  List<Users>? users;
  List<Favorites>? favorites;
  List<Comments>? comments;

  RecipeModel(
      {this.recipes,
      this.recipeIngredients,
      this.recipeSteps,
      this.recipeStepLink,
      this.measureUnits,
      this.ingredient,
      this.freezer,
      this.users,
      this.favorites,
      this.comments});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    if (json['Recipes'] != null) {
      recipes = <Recipes>[];
      json['Recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
    if (json['RecipeIngredients'] != null) {
      recipeIngredients = <RecipeIngredients>[];
      json['RecipeIngredients'].forEach((v) {
        recipeIngredients!.add(new RecipeIngredients.fromJson(v));
      });
    }
    if (json['RecipeSteps'] != null) {
      recipeSteps = <RecipeSteps>[];
      json['RecipeSteps'].forEach((v) {
        recipeSteps!.add(new RecipeSteps.fromJson(v));
      });
    }
    if (json['RecipeStepLink'] != null) {
      recipeStepLink = <RecipeStepLink>[];
      json['RecipeStepLink'].forEach((v) {
        recipeStepLink!.add(new RecipeStepLink.fromJson(v));
      });
    }
    if (json['MeasureUnits'] != null) {
      measureUnits = <MeasureUnits>[];
      json['MeasureUnits'].forEach((v) {
        measureUnits!.add(new MeasureUnits.fromJson(v));
      });
    }
    if (json['Ingredient'] != null) {
      ingredient = <Ingredient>[];
      json['Ingredient'].forEach((v) {
        ingredient!.add(new Ingredient.fromJson(v));
      });
    }
    if (json['Freezer'] != null) {
      freezer = <Freezer>[];
      json['Freezer'].forEach((v) {
        freezer!.add(new Freezer.fromJson(v));
      });
    }
    if (json['Users'] != null) {
      users = <Users>[];
      json['Users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
    if (json['Favorites'] != null) {
      favorites = <Favorites>[];
      json['Favorites'].forEach((v) {
        favorites!.add(new Favorites.fromJson(v));
      });
    }
    if (json['Comments'] != null) {
      comments = <Comments>[];
      json['Comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['Recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    if (this.recipeIngredients != null) {
      data['RecipeIngredients'] =
          this.recipeIngredients!.map((v) => v.toJson()).toList();
    }
    if (this.recipeSteps != null) {
      data['RecipeSteps'] = this.recipeSteps!.map((v) => v.toJson()).toList();
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

class Recipes {
  int? id;
  String? name;
  int? duration;
  String? photo;

  Recipes({this.id, this.name, this.duration, this.photo});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['photo'] = this.photo;
    return data;
  }
}

class RecipeIngredients {
  int? id;
  double? count;
  Ingredient? ingredient;
  Ingredient? recipe;

  RecipeIngredients({this.id, this.count, this.ingredient, this.recipe});

  RecipeIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    ingredient = json['ingredient'] != null
        ? new Ingredient.fromJson(json['ingredient'])
        : null;
    recipe =
        json['recipe'] != null ? new Ingredient.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class RecipeSteps {
  int? id;
  String? name;
  int? duration;

  RecipeSteps({this.id, this.name, this.duration});

  RecipeSteps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    return data;
  }
}

class RecipeStepLink {
  int? id;
  int? number;
  Ingredient? recipe;
  Ingredient? step;

  RecipeStepLink({this.id, this.number, this.recipe, this.step});

  RecipeStepLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    recipe =
        json['recipe'] != null ? new Ingredient.fromJson(json['recipe']) : null;
    step = json['step'] != null ? new Ingredient.fromJson(json['step']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class MeasureUnits {
  int? id;
  String? one;
  String? few;
  String? many;

  MeasureUnits({this.id, this.one, this.few, this.many});

  MeasureUnits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    one = json['one'];
    few = json['few'];
    many = json['many'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  Ingredient? measureUnit;

  Ingredient({this.id, this.name, this.measureUnit});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    measureUnit = json['measureUnit'] != null
        ? new Ingredient.fromJson(json['measureUnit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  Ingredient? user;
  Ingredient? ingredient;

  Freezer({this.id, this.count, this.user, this.ingredient});

  Freezer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    user = json['user'] != null ? new Ingredient.fromJson(json['user']) : null;
    ingredient = json['ingredient'] != null
        ? new Ingredient.fromJson(json['ingredient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class Users {
  int? id;
  String? login;
  String? photo;
  String? password;
  String? token;

  Users({this.id, this.login, this.photo, this.password, this.token});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    photo = json['photo'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['photo'] = this.photo;
    data['password'] = this.password;
    data['token'] = this.token;
    return data;
  }
}

class Favorites {
  int? id;
  Ingredient? recipe;
  Ingredient? user;

  Favorites({this.id, this.recipe, this.user});

  Favorites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipe =
        json['recipe'] != null ? new Ingredient.fromJson(json['recipe']) : null;
    user = json['user'] != null ? new Ingredient.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class Comments {
  int? id;
  String? text;
  String? photo;
  String? datetime;
  Ingredient? user;

  Comments({this.id, this.text, this.photo, this.datetime, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    photo = json['photo'];
    datetime = json['datetime'];
    user = json['user'] != null ? new Ingredient.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
