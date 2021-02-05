import 'package:bytebank/models/transferency.dart';
import 'package:bytebank/screen/transferency/form.dart';
import 'package:flutter/material.dart';

class TransferencyList extends StatefulWidget {
  final List<Transferency> _transferencies = List();

  @override
  State<StatefulWidget> createState() {
    return TransferencyListState();
  }
}

class TransferencyListState extends State<TransferencyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferência"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencies.length,
        itemBuilder: (context, index) {
          final transferency = widget._transferencies[index];
          return TransferencyItem(transferency);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferency> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferencyForm();
          }));
          future.then((transferencyReceived) {
            if (transferencyReceived != null) {
              setState(() {
                widget._transferencies.add(transferencyReceived);
              });
            }
          });
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
        title: Text(this._transferency.value.toString()),
        subtitle: Text(this._transferency.accountNumber.toString()),
      ),
    );
  }
}
