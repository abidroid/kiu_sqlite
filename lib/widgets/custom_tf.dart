import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;

  const CustomTF({
    super.key,
    required this.controller,
    required this.hintText,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
