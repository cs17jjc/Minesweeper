
Game MS;
int GridSize = 20;
int GameWidth = 10;
int GameHeight = 10;
int Difficulty = 10;

void setup()
{
  MS = new Game(GameWidth,GameHeight,Difficulty);
  size(GameWidth * GridSize,GameHeight * GridSize);
}

void draw()
{
  background(255);
  for(int x = 0; x < width;x+=GridSize)
  {
    line(x,0,x,height);
  }
  for(int y = 0; y < height;y+=GridSize)
  {
    line(0,y,width,y);
  }
  
  for(int x = 0; x < GameWidth; x++)
  {
    for(int y = 0; y < GameHeight; y++)
    {
      if(MS.MineField[x][y] == true)
      {
        fill(150);
        rect(x*GridSize,y*GridSize,GridSize,GridSize);
      }
    }
  }
  
}
