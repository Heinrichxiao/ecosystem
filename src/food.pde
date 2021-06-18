class Food extends PVector {
  float strength;
  float maxStrength;
  float size;
  boolean isEaten;
  
  Food(PVector pos) {
    set(pos.x, pos.y);
    strength = 1;
    size = strength * 2.5;
    isEaten = false;
    maxStrength = random(5, 10);
  }

  void eat() {
    isEaten = true;
  }
  
  void update() {
    strength += 1;
    size = strength * 1.5;
    if (strength >= maxStrength) {
      strength = maxStrength;
    }
  }
  
  void show() {
    push();
    translate(x, y);
    fill(0, 255, 0);
    circle(0, 0, size);
    pop();
  }
}
