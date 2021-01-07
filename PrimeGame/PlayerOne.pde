class PlayerOne extends Spieler {
  boolean isHuman = true;
  int score = 0;
  
  boolean turn = true;
  
  color playerColor = #83C5BE;
  
  IntList takenNum = new IntList();

  String getPlayerName () {
    return "Player 1";
  }

  int auswahl(int[] numbers) {
    return 0;
  }
}
