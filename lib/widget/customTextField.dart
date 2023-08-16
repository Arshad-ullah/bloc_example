import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.labelText,
    this.obscureText,
    this.onChanged,
    this.keyboardType,
    this.onTap,
    this.maxLines,
    this.validator,
    this.controller,
    //this.icon,
  });

  String? labelText;
  bool? obscureText;
  TextEditingController? controller;
  Icon? icon;
  Function(String)? onChanged;
  TextInputType? keyboardType;
  Function()? onTap;
  int? maxLines;
  Function(String)? validator = (value) {};

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      shadowColor: Colors.black,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType ?? TextInputType.text,
        validator: (value) => validator!(value!),
        onChanged: onChanged ?? (value) {},
        obscureText: obscureText ?? false,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          //icon: new Icon(Icons.lock, color: Color(0xff224597)),
          //hintText: 'Password',
          filled: true,

          labelText: labelText ?? '',

          labelStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
          ),
          fillColor: Colors.white,
          suffixIcon: obscureText == true || obscureText != null
              ? GestureDetector(
                  onTap: onTap ?? () {},
                  child: Icon(
                    obscureText == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black.withOpacity(0.5),
                  ),
                )
              : null,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.white, width: 3.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.white, width: 3.0),
          ),
        ),
      ),
    );
  }
}
