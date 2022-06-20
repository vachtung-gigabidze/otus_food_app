class RecipeModel {
  List<Recipes>? recipes;

  RecipeModel({this.recipes});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    if (json['Recipes'] != null) {
      recipes = <Recipes>[];
      json['Recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['Recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipes {
  int? id;
  String? name;
  String? time;
  List<Ingredients>? ingredients;
  List<CookingSteps>? cookingSteps;

  Recipes({this.id, this.name, this.time, this.ingredients, this.cookingSteps});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    if (json['cookingSteps'] != null) {
      cookingSteps = <CookingSteps>[];
      json['cookingSteps'].forEach((v) {
        cookingSteps!.add(new CookingSteps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    if (this.cookingSteps != null) {
      data['cookingSteps'] = this.cookingSteps!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}

enum CookingStepsStatus {
  passed,
  notPassed,
  notStarted,
}

class CookingSteps {
  int? order;
  String? step;
  String? duration;
  CookingStepsStatus? status;

  CookingSteps({this.order, this.step, this.duration, this.status});

  CookingSteps.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    step = json['step'];
    duration = json['duration'];
    status = json['status'] ?? CookingStepsStatus.notStarted;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['step'] = this.step;
    data['duration'] = this.duration;
    data['status'] = this.status;
    return data;
  }
}
