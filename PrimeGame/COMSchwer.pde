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
    IntList primeNumbers = new IntList();
    
    for (int i : numbers) {
      int[] factors = new int[faktoren(i).length];
      if (factors.length <= 2) {
        primeNumbers.append(i);
      }
    }
    
    if (primeNumbers.size() != 0) {
      return primeNumbers.max();
    } else if (numbers.length >= 1) {
      return numbers[numbers.length - 1];
    } else {
      return 0;
    }
  }
  
  int[] faktoren (int number) {
    IntList faktorenList = new IntList();
      for (int loopCounter = 1; loopCounter < number; loopCounter++) {
        // check if remainder of division is 0
        if (number % loopCounter == 0) {
          faktorenList.append(loopCounter);
        }
      }
      int[] faktorenArray = new int[faktorenList.size()];
      for (int i=0; i < faktorenArray.length; i++) {
        faktorenArray[i] = faktorenList.get(i);
      }
      
    return faktorenArray;
  }
}
