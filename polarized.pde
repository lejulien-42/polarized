int  map[][] = {
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0}
};

int player_pos[][] = {
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0}
};

int  s_width = 1920;
int  s_height = 1080;

// Image loading
PImage floor_1;
PImage floor_2;
PImage floor_3;
PImage input_frame;
PImage player;
PImage sky;
PFont  font;
PFont  font_term;
String entry = "> ";
String log[] = {""};

boolean is_summoned = false;

void
  tolog(String str)
{
  log = append(log, str);
}

void
  startup()
{
  tolog("Welcome to Polarized");
  tolog("");
  tolog("First of all you had to summon");
  tolog("your player");
  tolog("");
  tolog("To do so type help");
  tolog("");
}

void
  setup()
{
  size(800, 400);
  floor_1 = loadImage("floor_1.png");
  floor_2 = loadImage("floor_2.png");
  floor_3 = loadImage("floor_3.png");
  sky = loadImage("sky.jpg");
  player = loadImage("player.png");
  input_frame = loadImage("input_frame.png");
  font = createFont("8bitlim.ttf", 16);
  font_term = createFont("lunchds.ttf", 16);
  textFont(font);
  startup();
}

int time = 0;
int fps = 30;

void
  help()
{
  tolog("Here is the lst of all the commands");
  tolog("available");
  tolog("");
  tolog("help - show this page");
  if (!is_summoned)
    tolog("summon 0<>8 A<>H - create your player");
  tolog("");
}

void
  createPlayer(int row, char c)
{
  int col = 0;
  switch(c)
  {
    case 'A':
      col = 0;
      break;
    case 'B':
      col = 1;
      break;
    case 'C':
      col = 2;
      break;
    case 'D':
      col = 3;
      break;
    case 'E':
      col = 4;
      break;
    case 'F':
      col = 5;
      break;
    case 'G':
      col = 6;
      break;
    case 'H':
      col = 7;
      break;
  }
  player_pos[col][row] = 1;
}

void
  summon()
{ 
  tolog("");
  println(entry.charAt(9));
  if (entry.charAt(9) >= '0' && entry.charAt(9) < '9')
  {
    if (entry.charAt(11) == 'A' || entry.charAt(11) == 'B' || entry.charAt(11) == 'C' || entry.charAt(11) == 'D' || entry.charAt(11) == 'E' || entry.charAt(11) == 'F' || entry.charAt(11) == 'G' || entry.charAt(11) == 'H')
    {
      tolog("Player was summoned in " + entry.substring(9, entry.length()));
      is_summoned = true;
      createPlayer(entry.charAt(9) - '0', entry.charAt(11));
      tolog("New commands added type help");
      tolog("");
    }
    else
    {
      tolog("Wrong position\n");
      is_summoned = false;
    }
  }
  else
  {
    tolog("Wrong position\n");
    is_summoned = false;
  }
}

void
  command_logic()
{
  if (entry.equals("> help"))
    help();
  else if (entry.length() > 8 && entry.substring(2, 8).equals("summon") && is_summoned == false)
    summon();
  else
  {
    tolog(entry.substring(2, entry.length()) + " command not found");
    tolog("");
  }
}

void
  keyPressed()
{
  entry = entry + key;
  if (keyCode == BACKSPACE)
  {
    if (entry.length() > 3)
      entry = entry.substring( 0, entry.length()-2 );
    else
      entry = entry.substring( 0, entry.length()-1 );
  }
  if (keyCode == SHIFT)
    entry = entry.substring( 0, entry.length()-1 );
  if (keyCode == ENTER)
  {
    entry = entry.substring( 0, entry.length()-1 );
    if (entry.length() > 2)
    {
      tolog(entry);
      command_logic();
    }
    entry = "> ";
  }
}

void
  draw_map()
{
  int offset_x = 180;
  int offset_y = 100;
  int x = 0;
  int y = 0;
  
  background(50);
  image(sky, 0, 0, 800, 400);
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
  image(input_frame, 400, 0);
  x = 0;
  y = 0;
  while (y < 8)
  {
    x = 0;
    while (x < 8)
    {
      if (player_pos[y][x] == 1)
        image(player, offset_x + (x - y) * 20 - 4, offset_y + (y + x) * 12 - 45, 60, 70);
      x++;
    }
    y++;
  }
  textFont(font_term);
  text(entry, 415, 375);
  int i = 0;
  int j = 0;
  while (i + j < log.length)
  {
    while (log.length - j > 17)
      j++;
    text(log[i + j], 415, i * 20);
    i++;
  }
  textFont(font);
}

void
  draw()
{
  draw_map();
  time++;
  if (time > fps)
    time = 0;
}
