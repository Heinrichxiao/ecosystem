// Set most settings
int population = 10;
int numOfFoods = 100;
float newFoodProb = 1;
float birthHunger = -2;
ArrayList<Animal> animals = new ArrayList<Animal>();
ArrayList<Food> foods = new ArrayList<Food>();
float zoomlevel = 1;

void setup() {
  fullScreen();

  for (int i = 0; i < population; i++) {
    animals.add(new Animal(randomPoint()));
  }
  
  for (int i = 0; i < numOfFoods; i++) {
    addFood();
  }
  frameRate(240);
  //noCursor();
}



void draw() {
  background(0);
  
  noStroke();
  translate(mouseX, mouseY);
  scale(zoomlevel);
  translate(-mouseX, -mouseY);
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

// Add additional food or animal
void keyPressed() {
  if (key == 'f') {
    addFood(mouseX, mouseY);
    println("food");
  } else if (key == 'a') {
    addAnimal(mouseX, mouseY);
    println("animals");
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoomlevel -= e / 10;
  if (zoomlevel < 1) {
    zoomlevel = 1;
  }
}
