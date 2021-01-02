class PlayerTwo extends Spieler {
  boolean isHuman = true;
  int score = 0;
  
  boolean turn = false;
  
  IntList takenNum = new IntList(); 
  
  color playerColor = #E29578;

  String getPlayerName () {
    return "PlayerTwo";
  }

  int auswahl(int[] numbers) {
    return 0;
  }
}
