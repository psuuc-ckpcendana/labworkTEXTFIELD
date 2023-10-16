import 'package:flutter/material.dart';
import 'package:textfield/screens/screen.dart';

void main (){
  runApp(const LabWorkTextField());
}
class LabWorkTextField extends StatelessWidget {
  const LabWorkTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextFieldScreen(),
    );
  }
}