import 'package:bytebank/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction({this.value, this.contact});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      value: double.tryParse(json['value']),
      contact: Contact(json['client']['id'], json['client']['name'],
          json['client']['account']['account_number']),
    );
  }

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
