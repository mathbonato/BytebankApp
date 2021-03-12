import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData icon;

  const Editor({this.controller, this.label, this.tip, this.icon});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.orange,
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null
              ? Icon(
                  icon,
                  color: Colors.orange,
                )
              : null,
          labelText: label,
          labelStyle: TextStyle(color: Colors.orange),
          hintText: tip,
          hintStyle: TextStyle(color: Colors.orange),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
