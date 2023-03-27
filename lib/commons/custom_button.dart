import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: black),
      ),
      style: ElevatedButton.styleFrom(
          primary: tabColor, minimumSize: Size(double.infinity, 50)),
    );
  }
}
