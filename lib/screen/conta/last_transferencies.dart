import 'package:bytebank/models/transferencies.dart';
import 'package:bytebank/screen/conta/transferency_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastTransferencies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Últimas Transferências',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        Consumer<Transferencies>(builder: (context, transferencies, child) {
          final itemCount = transferencies.transferencies.length;
          final lastTransferencies =
              transferencies.transferencies.reversed.toList();
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TransferencyItem(lastTransferencies[index]);
            },
            itemCount: itemCount < 2 ? itemCount : 2,
          );
        }),
        RaisedButton(
          child: Text('Transferências'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TransferencyList();
            }));
          },
        ),
      ],
    );
  }
}
