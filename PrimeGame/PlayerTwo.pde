class PlayerTwo extends Spieler {
  boolean isHuman = true;
  int score = 0;
  
  boolean turn = false;
  
  color playerColor = #E29578;

  String getPlayerName () {
    return "Player 2";
  }

  int auswahl(int[] numbers) {
    return 0;
  }
}
