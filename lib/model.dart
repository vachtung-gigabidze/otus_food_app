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
  String? name;
  String? time;
  int? cookingCount;
  String? imageUrl;
  List<Ingredient>? ingredients;
  List<CookingStep>? cookingSteps;

  Recipe(
      {this.id,
      this.name,
      this.time,
      this.cookingCount,
      this.imageUrl,
      this.ingredients,
      this.cookingSteps});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['time'] = time;
    data['cookingCount'] = cookingCount;
    data['imageUrl'] = imageUrl;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    if (cookingSteps != null) {
      data['cookingSteps'] = cookingSteps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredient {
  String? name;
  String? quantity;
  String? unit;

  Ingredient({this.name, this.quantity, this.unit});

  Ingredient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['quantity'] = quantity;
    data['unit'] = unit;
    return data;
  }
}

// class Fridge {
//   String? name;
//   String? quantity;
//   String? unit;

//   Fridge({this.name, this.quantity, this.unit});

//   Fridge.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     quantity = json['quantity'];
//     unit = json['unit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['name'] = name;
//     data['quantity'] = quantity;
//     data['unit'] = unit;
//     return data;
//   }
// }

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
