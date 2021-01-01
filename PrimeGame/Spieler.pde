abstract class Spieler {
  boolean isHuman;
  int score;
  
  public abstract String getPlayerName ();
  public abstract int auswahl(int[] numbers);
}
