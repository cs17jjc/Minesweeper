

public class Game
{

  public boolean[][] MineField;
  public int[][] CountField;
  public boolean[][] ShowField;
  
  public boolean Playing = true;
  public boolean Win = false;
  public int ShownCount = 0;
  
  int Width;
  int Height;
  int Diff;
  
  Game(int Width, int Height, int Difficulty)
  {
     this.Width = Width;
     this.Height = Height;
     this.Diff = Difficulty;
     MineField = new boolean[Width][Height];
     CountField = new int[Width][Height];
     ShowField = new boolean[Width][Height];
     
     for(int i = 0; i < Difficulty;i++)//Difficulty is ammount of bombs
     {
      boolean Picked = false;
      while(Picked == false)//While a new location hasn't been picked as RNG could pick same location
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
                CountField[XPos][YPos] += 1;//Add 1 to the count of surounding cells
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
   if(MineField[x][y] == true)
   {
     ShowField[x][y] = true;
     Playing = false;
     return;
   }
   if(CountField[x][y] != 0)
   {
     ShowField[x][y] = true;
     ShownCount += 1;
   }
   else
   {
     RecursiveReveal(x,y);
   }
   
   if(ShownCount == (Width * Height) - Diff)
   {
    Win = true;
    Playing = false;
   }
   
  }
  
  public void RecursiveReveal(int x,int y)
  {
    ShowField[x][y] = true;
    ShownCount += 1;
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
                 if(ShowField[XPos][YPos] == false)
                 {
                   if(CountField[XPos][YPos] != 0)
                   {
                     ShowField[XPos][YPos] = true;
                     ShownCount += 1;  
                   }
                   if(MineField[XPos][YPos] != true && CountField[XPos][YPos] == 0) RecursiveReveal(XPos,YPos);
                 }
               }
             }
           }
         }
  }
  
}




















