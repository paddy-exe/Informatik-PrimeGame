class COMLeicht extends Spieler {
  boolean isHuman = false;
  int score = 0;
  
  boolean turn = false;
  
  color playerColor = #E29578;
  
  IntList auswahlNumbers = new IntList();

  String getPlayerName () {
    return "COM Leicht";
  }

  int auswahl(int[] numbers) {
    int randomNum = (int)random(numbers.length);
    int auswahlNum;
    
    if (numbers.length > 0) {
        auswahlNum = numbers[randomNum];
    } else {
        auswahlNum = numbers[0];
    }    
    return auswahlNum;
  }
}
