class Animal extends PVector {
  PVector vel;
  PVector acc;
  float size;
  float maxSpeed;
  float maxForce;
  float maxHunger;
  float viewSize;
  float hunger;

  Animal(PVector pos) {
    set(pos.x, pos.y);
    randomDir();
    acc = new PVector();
    size = 16;
    maxSpeed = 4;
    maxForce = 0.5;
    viewSize = 100;
    hunger = 0;
    maxHunger = random(15, 30);
  }
  
  void randomDir() {
    vel = PVector.random2D();
  }
  
  void applyForce(PVector f) {
    PVector force = f.copy();
    force.div(size);
    acc.add(force);
  }
  
  void seek(Food food) {
    PVector force = PVector.sub(food, this);
    force.setMag(maxSpeed);
    force.sub(vel);
    force.limit(maxForce);
    applyForce(force);
  }
  
  void update(ArrayList<Food> foods) {
    steerToClosest(foods);
    
    edges();
    
    vel.add(acc);
    vel.limit(maxSpeed);
    add(vel);
    acc.set(0, 0);
    
    for (Food food : foods) {
      if (canEat(food)) {
        food.eat();
        hunger -= food.strength / 10;
      }
    }
    hunger += 0.025;
  }

  void steerToClosest(ArrayList<Food> foods) {
    Food closest = null;
    for (Food food : foods) {
      PVector distVecToFood = PVector.sub(this, food);
      float centerDistToFood = distVecToFood.mag();
      if (closest == null) {
        if (centerDistToFood <= viewSize / 2) {
          closest = food;
        }
        continue;
      }
      PVector distVecToClosest = PVector.sub(this, closest);
      float centerDistToClosest = distVecToClosest.mag();
      if (centerDistToFood < centerDistToClosest && centerDistToFood <= viewSize / 2) {
        closest = food;
      }
    }
    if (closest != null) {
      seek(closest);
    }
  }
  
  void edges() {
    if (y >= height-size/2) {
      y = height-size/2;
      vel.y *= -1;
    } else if (y <= size/2) {
      y = size/2;
      vel.y *= -1;
    }

    if (x >= width-size/2) {
      x = width-size/2;
      vel.x *= -1;
    } else if (x <= size/2) {
      x = size/2;
      vel.x *= -1;
    }
  }

  boolean canEat(Food food) {
    PVector distVec = PVector.sub(this, food);
    float centerDist = distVec.mag();
    float edgeDist = centerDist - size / 2 - food.size / 2;

    if (edgeDist <= 0) return true;
    else return false;
  }

  void show() {
    push();
    translate(x, y);
    fill(255, 0, 0);
    circle(0, 0, size);
    fill(255, 0, 0, 100);
    circle(0, 0, viewSize);
    pop();
  }
}
