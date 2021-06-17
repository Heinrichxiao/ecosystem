class Food extends PVector {
  float size;
  boolean isEaten;
  
  Food(PVector pos) {
    set(pos.x, pos.y);
    size = 16;
    isEaten = false;
  }

  void eat() {
    isEaten = true;
  }
  
  void update() {
    size += 5;
    if (size >= maxStrengthFood) {
      size = maxStrengthFood;
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
