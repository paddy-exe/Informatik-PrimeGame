class COMMittel extends Spieler {
  boolean isHuman = false;
  int score = 0;
  
  boolean turn = false;
  
  color playerColor = #E29578;
  
  IntList auswahlNumbers = new IntList();

  String getPlayerName () {
    return "COM 2";
  }

  int auswahl(int[] numbers) {
    int auswahlNum = 0;
    
    if (numbers.length >= 2) {
        auswahlNum = numbers[numbers.length - 1];
    } else if (numbers.length == 1) {
        auswahlNum = numbers[0];
    }    
    return auswahlNum;
  }
}
