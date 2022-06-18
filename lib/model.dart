class RecipeModel {
  RecipeModel(
    this.id,
    this.name,
    this.time,
    this.ingredients,
    this.cookingSteps,
  );
  int id;
  String name;
  String time;
  List<Ingredient> ingredients;
  List<CookingStep> cookingSteps;
}

enum CookingStepsStatus {
  passed,
  notPassed,
  notStarted,
}

class CookingStep {
  CookingStep(
    this.order,
    this.step,
    this.duration,
    this.status,
  );
  int order;
  String step;
  int duration;
  CookingStepsStatus status;
}

class Ingredient {
  Ingredient(this.name, this.quantity);
  String name;
  String quantity;
}
