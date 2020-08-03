int  map[][] = {
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 3, 2, 0, 0, 1}
};

int player_pos[][] = {
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1}
};

int  s_width = 1920;
int  s_height = 1080;

// Image loading
PImage floor_1;
PImage floor_2;
PImage floor_3;
PFont  font;

void
  setup()
{
  size(800, 400);
  floor_1 = loadImage("floor_1.png");
  floor_2 = loadImage("floor_2.png");
  floor_3 = loadImage("floor_3.png");
  font = createFont("8bitlim.ttf", 16);
  textFont(font);
}

int time = 0;
int fps = 30;

void
  draw_map()
{
  int offset_x = 180;
  int offset_y = 100;
  int x = 0;
  int y = 0;
  
  background(50);
  stroke(200);
  line(400, 0, 400, 400);
  while (y < 8)
  {
    x = 0;
    while (x < 8)
    {
      if (map[y][x] == 0)
        image(floor_1, offset_x + (x  - y) * 20, offset_y + (y + x) * 12);
      if (map[y][x] == 1)
        image(floor_2, offset_x + (x - y) * 20, offset_y + (y + x) * 12);
      if (map[y][x] == 2)
        image(floor_3, offset_x + (x - y) * 20, offset_y + (y + x) * 12);
      x++;
    }
    y++;
  }
  text("0", 190, 100); // -25 +10
  text("1", 170, 110);
  text("2", 145, 125);
  text("3", 125, 135);
  text("4", 105, 145);
  text("5", 85, 160);
  text("6", 60, 170);
  text("7", 40, 185);
  text("A", abs(190 - 405), 100); // -25 +10
  text("B", abs(170 - 405), 110);
  text("C", abs(145 - 405), 125);
  text("D", abs(125 - 405), 135);
  text("E", abs(105 - 405), 145);
  text("F", abs(85 - 405), 160);
  text("G", abs(60 - 405), 170);
  text("H", abs(40 - 405), 185);
  text("x " + mouseX + " | y " + mouseY, mouseX, mouseY);
}

void
  draw()
{
  draw_map();
  time++;
  if (time > fps)
    time = 0;
}
