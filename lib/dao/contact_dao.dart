import 'package:bytebank/db/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  Future<int> save(Contact contact) async {
    final Database db = await open();
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await open();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    final List<Contact> contacts = List();
    result.forEach((row) {
      final Contact contact = Contact(
        row['id'],
        row['name'],
        row['account_number'],
      );
      contacts.add(contact);
    });
    return contacts;
  }

  Future<int> delete(int id) async {
    final Database db = await open();
    return await db.rawDelete('DELETE FROM contacts WHERE id = ?', [id]);
  }
}
