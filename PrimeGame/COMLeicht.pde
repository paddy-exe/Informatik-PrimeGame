class COMLeicht extends Spieler {
  boolean isHuman = false;
  int score = 0;
  
  boolean turn = false;
  
  color playerColor = #E29578;
  
  IntList auswahlNumbers = new IntList();

  String getPlayerName () {
    return "COM 1";
  }

  int auswahl(int[] numbers) {
    int randomNum = (int)random(numbers.length);
    int auswahlNum = 0;
    
    if (numbers.length >= 2) {
        auswahlNum = numbers[randomNum];
    } else if (numbers.length == 1) {
        auswahlNum = numbers[0];
    }    
    return auswahlNum;
  }
}
