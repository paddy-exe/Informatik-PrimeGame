class COMMittel extends Spieler {
  boolean isHuman = false;
  int score = 0;
  
  boolean turn = false;
  
  color playerColor = #E29578;
  
  IntList auswahlNumbers = new IntList();

  String getPlayerName () {
    return "COM Mittel";
  }

  int auswahl(int[] numbers) {
    int auswahlNum;
    
    if (numbers.length > 1) {
        auswahlNum = numbers[numbers.length - 1];
    } else {
        auswahlNum = 0;
    }    
    return auswahlNum;
  }
}
