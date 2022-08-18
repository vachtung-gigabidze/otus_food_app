class RecipesModel {
  List<Recipe>? recipes;

  RecipesModel({this.recipes});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    if (json['Recipes'] != null) {
      recipes = <Recipe>[];
      json['Recipes'].forEach((v) {
        recipes!.add(Recipe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (recipes != null) {
      data['Recipes'] = recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipe {
  int? id;
  bool? isCooking;
  Set<Favorites>? favorites;
  String? name;
  int? time;
  int? cookingCount;
  String? imageUrl;
  List<Ingredient>? ingredients;
  List<CookingStep>? cookingSteps;
  List<Comment>? comments;

  Recipe(
      {this.id,
      this.isCooking = false,
      this.name,
      this.favorites,
      this.time,
      this.cookingCount,
      this.imageUrl,
      this.ingredients,
      this.cookingSteps,
      this.comments});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    if (json['favorites'] != null) {
      favorites = <Favorites>{};
      json['favorites'].forEach((v) {
        favorites!.add(Favorites.fromJson(v));
      });
    }
    cookingCount = json['cookingCount'];
    imageUrl = json['imageUrl'];

    if (json['ingredients'] != null) {
      ingredients = <Ingredient>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredient.fromJson(v));
      });
    }
    if (json['cookingSteps'] != null) {
      cookingSteps = <CookingStep>[];
      json['cookingSteps'].forEach((v) {
        cookingSteps!.add(CookingStep.fromJson(v));
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
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['time'] = time.toString();
    if (favorites != null) {
      data['favorites'] = favorites!.map((v) => v.toJson()).toList();
    }
    data['cookingCount'] = cookingCount;
    data['imageUrl'] = imageUrl;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    if (cookingSteps != null) {
      data['cookingSteps'] = cookingSteps!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  void updateCookingSteps() {
    cookingSteps![0].status = (isCooking ?? false)
        ? CookingStepsStatus.passed
        : CookingStepsStatus.notStarted;
    for (int i = 1; i < cookingSteps!.length; i++) {
      cookingSteps![i].status = (isCooking ?? false)
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

  bool isFavorite(String username) {
    return favorites!.any((element) => element.username == username);
  }

  void addFavorite(String username) {
    favorites!.add(Favorites(username: username));
  }

  void removeFavorite(String username) {
    favorites!.remove(Favorites(username: username));
  }
}

class Ingredient {
  String? name;
  String? quantity;
  String? unit;

  Ingredient({this.name, this.quantity, this.unit});

  Ingredient.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    quantity = json['quantity'] ?? "";
    unit = json['unit'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['quantity'] = quantity;
    data['unit'] = unit;

    return data;
  }

  String showQuantity() {
    return '$quantity $unit';
  }
}

enum CookingStepsStatus {
  passed,
  notPassed,
  notStarted,
}

class CookingStep {
  int? order;
  String? step;
  String? duration;
  CookingStepsStatus? status;

  CookingStep({this.order, this.step, this.duration, this.status});

  CookingStep.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    step = json['step'];
    duration = json['duration'];
    status = json['status'] ?? CookingStepsStatus.notStarted;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['order'] = order;
    data['step'] = step;
    data['duration'] = duration;
    data['status'] = status;
    return data;
  }
}

class FridgeModel {
  List<Ingredient>? fridge;

  FridgeModel({this.fridge});

  FridgeModel.fromJson(Map<String, dynamic> json) {
    if (json['fridge'] != null) {
      fridge = <Ingredient>[];
      json['fridge'].forEach((v) {
        fridge!.add(Ingredient.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (fridge != null) {
      data['fridge'] = fridge!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comment {
  String? author;
  String? avatar;
  String? date;
  String? comment;
  String? image;

  Comment({this.author, this.avatar, this.date, this.comment, this.image});

  Comment.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    avatar = json['avatar'];
    date = json['date'];
    comment = json['comment'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['author'] = author;
    data['avatar'] = avatar;
    data['date'] = date;
    data['comment'] = comment;
    data['image'] = image;
    return data;
  }
}

class Favorites {
  String? username;

  Favorites({this.username});

  Favorites.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      other is Favorites &&
      other.runtimeType == runtimeType &&
      other.username == username;

  @override
  int get hashCode => username.hashCode;
}

class User {
  String? username;

  User({this.username});

  User.fromJson(Map<String, dynamic> json) {
    username = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['login'] = username;
    return data;
  }
}
