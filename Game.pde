

public class Game
{
  int Width;
  int Height;
  int Diff;
  
  public boolean[][] MineField;
  
  Game(int Width, int Height, int Difficulty)
  {
     this.Width = Width;
     this.Height = Height;
     this.Diff = Difficulty;
     MineField = new boolean[Width][Height];
     for(int i = 0; i < Difficulty;i++)
     {
      boolean Picked = false;
      while(Picked == false)
      {
       int x = (int)random(Width);
       int y = (int)random(Height);
        if(MineField[x][y] == true)
       {
        Picked = false;
       }
       else
       {
         MineField[x][y] = true;
         Picked = true;
       }
      }
     }
  }
  
  
}
