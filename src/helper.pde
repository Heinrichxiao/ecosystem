// Declare helper functions
PVector randomPoint() {
  return new PVector(random(width), random(height));
}

void addFood() {
  foods.add(new Food(randomPoint()));
}

void addFood(float x, float y) {
  foods.add(new Food(new PVector(x, y)));
}

void addAnimal() {
  animals.add(new Animal(randomPoint()));
}

void addAnimal(float x, float y) {
  animals.add(new Animal(new PVector(x, y)));
}

void addAnimal(PVector pos) {
  animals.add(new Animal(pos));
}
