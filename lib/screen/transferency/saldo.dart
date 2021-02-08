import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';

class SaldoCard extends StatelessWidget {
  final Saldo saldo;

  const SaldoCard({this.saldo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          saldo.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
