import 'package:bytebank/screen/dashboard/dashboard.dart';
import 'package:bytebank/screen/transferency/dashboard_transferency.dart';
import 'package:bytebank/screen/transferency/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bytebank());
}

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      //home: SignInDemo()
      home: DashboardTransferencia(),
    );
  }
}
