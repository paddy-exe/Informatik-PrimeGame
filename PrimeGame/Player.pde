class Player extends Spieler {
  boolean isHuman = true;
  int score = 0;
  
  boolean turn;
  
  color playerColor;

  Player (boolean turn, color playerColor) {
    this.turn = turn;
    this.playerColor = playerColor;
  }

  String getPlayerName () {
    return "Player 1";
  }

  int auswahl(int[] numbers) {
    return 0;
  }
}
