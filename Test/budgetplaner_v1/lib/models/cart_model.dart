import "package:flutter/material.dart";

class CartModel extends ChangeNotifier {
  int bp = 0;
  int pla = 0;

  void addBudget() {
    bp++;
    notifyListeners();
  }

  void addPla() {
    pla++;
    notifyListeners();
  }

  void removeBudget() {
    if (bp > 0) {
      bp--;
      notifyListeners();
    }
  }

  void removePla() {
    if (pla > 0) {
      pla--;
      notifyListeners();
    }
  }

  void clearbp() {
    bp = 0;

    notifyListeners();
  }

  void clearpla() {
    pla = 0;

    notifyListeners();
  }

  int get total => bp + pla;

  int get se => bp * pla;
}
