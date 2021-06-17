int population = 100;
int numOfFoods = 100;
float newFoodProb = 0.5;
float birthHunger = -2;
float maxStrengthFood = 20;
ArrayList<Animal> animals = new ArrayList<Animal>();
ArrayList<Food> foods = new ArrayList<Food>();

PVector randomPoint() {
  return new PVector(random(width), random(height));
}

void setup() {
  fullScreen();

  for (int i = 0; i < population; i++) {
    animals.add(new Animal(randomPoint()));
  }
  
  for (int i = 0; i < numOfFoods; i++) {
    addFood();
  }
  frameRate(240);
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

void draw() {
  background(0);
  
  noStroke();
  for (int i = 0; i < animals.size(); i++) {
    Animal animal = animals.get(i);
    animal.show();
    animal.update(foods);
    if (animal.hunger > animal.maxHunger) {
      animals.remove(animal);
      continue;
    }
    if (animal.hunger < birthHunger) {
      // Adding the new baby
      addAnimal(animal);
      
      // Giving birth takes energy
      animal.hunger += 1;
    }
  }
  
  for (int i = 0; i < foods.size(); i++) {
    Food food = foods.get(i);
    food.update();
    food.show();
    if (food.isEaten) {
      foods.remove(food);
      continue;
    }
  }
  
  if (random(1) < newFoodProb) {
    addFood();
  }
}

void keyPressed() {
  if (key == 'a') {
    addFood(mouseX, mouseY);
  }
}
