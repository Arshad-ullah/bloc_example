import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  Color? color;
  CustomBackButton({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: 20,
        color: color ?? Colors.grey,
      ),
    );
  }
}
