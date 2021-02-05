import 'package:bytebank/components/TextEdit/TextEdit.dart';
import 'package:bytebank/models/transferency.dart';
import 'package:bytebank/screen/transferency/list.dart';
import 'package:flutter/material.dart';

class TransferencyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TranferencyFormState();
  }
}

class TranferencyFormState extends State<TransferencyForm> {
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Transferência"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextEdit(
              value: _accountNumber,
              label: 'Número da conta',
              hint: '0000',
            ),
            TextEdit(
              value: _value,
              label: 'Valor',
              hint: '0000.0',
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => addTranferency(context),
            )
          ],
        ),
      ),
    );
  }

  void addTranferency(BuildContext context) {
    debugPrint('Confima');
    final int accountNumber = int.tryParse(_accountNumber.text);
    final double value = double.tryParse(_value.text);
    if (accountNumber != null && value != null) {
      final transferency = Transferency(value, accountNumber);
      Navigator.pop(context, transferency);
    }
  }
}

class TransferencyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransferencyList();
  }
}
