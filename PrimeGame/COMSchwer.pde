class COMSchwer extends Spieler {
  boolean isHuman = false;
  int score = 0;
  
  boolean turn = false;
  
  color playerColor = #E29578;
  
  IntList auswahlNumbers = new IntList();

  String getPlayerName () {
    return "COM 3";
  }

  int auswahl(int[] numbers) {
    return 0;
  }
}
