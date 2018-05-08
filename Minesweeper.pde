
Game MS;
int GridSize = 20;
int GameWidth = 10;
int GameHeight = 10;
int Difficulty = 10;

void setup()
{
  MS = new Game(GameWidth,GameHeight,Difficulty);
  size(GameWidth * GridSize,GameHeight * GridSize);
  textSize(GridSize);
  textAlign(LEFT, TOP);
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
        if(MS.ShowField[x][y] == true)
        {
          if(MS.CountField[x][y] != 0)
          {
           fill(200,0,0);
           text(MS.CountField[x][y],x*GridSize,(y)*GridSize);
          }
          else
          {
            fill(100,0,200);
            rect(x*GridSize,y*GridSize,GridSize,GridSize);
          }
          if(MS.MineField[x][y] == true)
          {
            fill(255,0,0);
            rect(x*GridSize,y*GridSize,GridSize,GridSize);
          }
       }
    }
  }
}

  void mousePressed() 
  {
    int x = floor(mouseX / GridSize);
    int y = floor(mouseY / GridSize);
    MS.Reveal(x,y);
  }
