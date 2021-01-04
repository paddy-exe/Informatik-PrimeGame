class PlayerOne extends Spieler {
  boolean isHuman = true;
  int score = 0;
  
  boolean turn = true;
  
  color playerColor = #83C5BE;

  String getPlayerName () {
    return "PlayerOne";
  }

  int auswahl(int[] numbers) {
    return 0;
  }
}
