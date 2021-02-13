import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

const String baseUrl = "https://drf-tst.herokuapp.com/";

Future<List<Transaction>> findAll() async {
  final response =
      await get("${baseUrl}transactionlist/").timeout(Duration(seconds: 5));

  if (response.statusCode == 200) {
    List<dynamic> json = jsonDecode(response.body);
    List<Transaction> list = List();

    for (Map<String, dynamic> element in json) {
      final transaction = Transaction(
          value: double.tryParse(element['value']),
          contact: Contact(
            element['client']['id'],
            element['client']['name'],
            int.tryParse(element['client']['account']['account_number']),
          ));
      list.add(transaction);
    }

    return list;
  } else {
    throw Exception('$response.statusCode');
  }
}

void save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'client': transaction.contact.id,
  };

  final String transactionJson = jsonEncode(transactionMap);

  final response = await post("${baseUrl}transactions/",
      headers: {
        'Content-type': 'application/json',
      },
      body: transactionJson);

  print(response.statusCode);
}
