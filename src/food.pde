class Food extends PVector {
  float size;
  float maxStrength;
  boolean isEaten;
  
  Food(PVector pos) {
    set(pos.x, pos.y);
    size = 16;
    isEaten = false;
    maxStrength = random(5, 10);
  }

  void eat() {
    isEaten = true;
  }
  
  void update() {
    size += 5;
    if (size >= maxStrength) {
      size = maxStrength;
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
