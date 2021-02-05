import 'package:flutter/material.dart';

class TextEdit extends StatelessWidget {
  final TextEditingController value;
  final String label;
  final String hint;
  final IconData icon;

  const TextEdit({this.value, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: TextField(
        controller: value,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
