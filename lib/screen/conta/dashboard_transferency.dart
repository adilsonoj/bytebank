import 'package:bytebank/screen/conta/deposito_form.dart';
import 'package:bytebank/screen/conta/last_transferencies.dart';
import 'package:bytebank/screen/conta/saldo.dart';
import 'package:bytebank/screen/conta/transferency_form.dart';
import 'package:flutter/material.dart';

class DashboardTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bytebank'),
        ),
        body: ListView(children: [
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Receber Depósito'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DepositoForm();
                  }));
                },
              ),
              RaisedButton(
                child: Text('Nova Transfência'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TransferencyForm();
                  }));
                },
              ),
            ],
          ),
          LastTransferencies(),
        ]));
  }
}
