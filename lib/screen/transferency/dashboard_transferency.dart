import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screen/transferency/saldo.dart';
import 'package:flutter/material.dart';

class DashboardTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bytebank'),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SaldoCard(
            saldo: Saldo(30.0),
          ),
        ));
  }
}
