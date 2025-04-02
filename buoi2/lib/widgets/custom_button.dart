import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.icon});

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon != null ? Icon(icon) : SizedBox.shrink(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
                minimumSize: MaterialStateProperty.all(Size(200, 50)),
      ),
      onPressed: () {},
      label: Text(text),
    );
  }
}
