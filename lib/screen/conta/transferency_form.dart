import 'package:bytebank/components/TextEdit/TextEdit.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencies.dart';
import 'package:bytebank/models/transferency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferencyForm extends StatelessWidget {
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _valueTransfer = TextEditingController();

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
              value: _valueTransfer,
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
    final double valueTransfer = double.tryParse(_valueTransfer.text);

    if (_validate(context, accountNumber, valueTransfer)) {
      final transferency = Transferency(valueTransfer, accountNumber);

      _updateState(context, transferency, valueTransfer);

      Navigator.pop(context);
    }
  }

  _validate(context, accountNumber, valueTransfer) {
    final double saldo = Provider.of<Saldo>(context, listen: false).value;
    final saldoInsuficiente = saldo < valueTransfer;
    final camposPreenchidos = accountNumber != null && valueTransfer != null;

    return !saldoInsuficiente && camposPreenchidos;
  }

  _updateState(context, transferency, valueTransfer) {
    Provider.of<Transferencies>(context, listen: false).add(transferency);
    Provider.of<Saldo>(context, listen: false).sub(valueTransfer);
  }
}
