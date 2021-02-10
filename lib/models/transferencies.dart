import 'package:bytebank/models/transferency.dart';
import 'package:flutter/material.dart';

class Transferencies extends ChangeNotifier {
  final List<Transferency> _transferencies = [];

  List<Transferency> get transferencies => _transferencies;

  add(Transferency transferency) {
    transferencies.add(transferency);

    notifyListeners();
  }
}
