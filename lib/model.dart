class RecipesModel {
  List<Recipes>? recipes;

  RecipesModel({this.recipes});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    if (json['Recipes'] != null) {
      recipes = <Recipes>[];
      json['Recipes'].forEach((v) {
        recipes!.add(Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (recipes != null) {
      data['Recipes'] = recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipes {
  int? id;
  String? name;
  String? time;
  String? imageUrl;
  List<Ingredients>? ingredients;
  List<CookingStep>? cookingSteps;

  Recipes(
      {this.id,
      this.name,
      this.time,
      this.imageUrl,
      this.ingredients,
      this.cookingSteps});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    imageUrl = json['imageUrl'];

    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['time'] = time;
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

class Ingredients {
  String? name;
  String? quantity;

  Ingredients({this.name, this.quantity});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['quantity'] = quantity;
    return data;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['order'] = order;
    data['step'] = step;
    data['duration'] = duration;
    data['status'] = status;
    return data;
  }
}
