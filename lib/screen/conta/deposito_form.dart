import 'package:bytebank/components/TextEdit/TextEdit.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositoForm extends StatelessWidget {
  final TextEditingController _value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Depósito"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextEdit(
              value: _value,
              label: 'Valor',
              hint: '000.0',
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => addDeposito(context),
            )
          ],
        ),
      ),
    );
  }

  addDeposito(context) {
    final double value = double.tryParse(_value.text);
    if (_validator(value)) {
      _updateState(context, value);
      Navigator.pop(context);
    }
  }

  _validator(value) {
    final _campoPreenchido = value != null;
    return _campoPreenchido;
  }

  _updateState(context, value) {
    //atualiza o state sem executar mudança na tela
    Provider.of<Saldo>(context, listen: false).add(value);
  }
}
