

public class Game
{

  public boolean[][] MineField;
  public int[][] CountField;
  public boolean[][] ShowField;
  
  Game(int Width, int Height, int Difficulty)
  {
     MineField = new boolean[Width][Height];
     CountField = new int[Width][Height];
     ShowField = new boolean[Width][Height];
     
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
         for(int Xoff = -1; Xoff <2; Xoff+= 1)
         {
           for(int Yoff = -1; Yoff <2; Yoff+= 1)
           {
             if(Xoff != 0 || Yoff != 0)
             {
               int XPos = x + Xoff;
               int YPos = y + Yoff;
               if(XPos >= 0 && XPos < Width && YPos >= 0 && YPos < Height)
               {
                CountField[XPos][YPos] += 1;
               }
             }
           }
         }
         Picked = true;
       }
      }
     }
  }
  
  public void Reveal(int x,int y)
  {
   if(ShowField[x][y] == true) return; 
    
    
  }
}




















