import 'package:bytebank/models/transferencies.dart';
import 'package:bytebank/models/transferency.dart';
import 'package:bytebank/screen/conta/transferency_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferencyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferência"),
      ),
      body: Consumer<Transferencies>(
        builder: (context, transferencies, child) {
          return ListView.builder(
            itemCount: transferencies.transferencies.length,
            itemBuilder: (context, index) {
              final transferency = transferencies.transferencies[index];
              return TransferencyItem(transferency);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferencyForm();
          }));
        },
      ),
    );
  }
}

class TransferencyItem extends StatelessWidget {
  final Transferency _transferency;

  TransferencyItem(this._transferency);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text('R\$ ${this._transferency.value.toString()}'),
        subtitle: Text(this._transferency.accountNumber.toString()),
      ),
    );
  }
}
