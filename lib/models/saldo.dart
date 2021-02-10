import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double value;

  Saldo(this.value);

  void add(double value) {
    this.value += value;

    notifyListeners();
  }

  void sub(double value) {
    this.value -= value;

    notifyListeners();
  }

  @override
  String toString() => 'R\$ $value';
}
