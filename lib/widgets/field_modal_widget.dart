import 'package:flutter/material.dart';

class FielModalWidget extends StatelessWidget {
  String hint;
  TextEditingController controller;
  bool isNumberKeryboard;
  
  FielModalWidget({required this.hint,
  required this.controller,
  this.isNumberKeryboard =false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        keyboardType: isNumberKeryboard? TextInputType.number: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.4),
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          contentPadding: EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}