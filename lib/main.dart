import 'package:bytebank/http/tansaction_service.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/models/transferencies.dart';
import 'package:bytebank/screen/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Saldo(0),
        ),
        ChangeNotifierProvider(
          create: (context) => Transferencies(),
        ),
      ],
      child: Bytebank(),
    ),
  );
  save(Transaction(value: 300.0, contact: Contact(3, "Evelyn", 5000)));
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
        // home: DashboardTransferencia(),
        home: Dashboard());
  }
}
