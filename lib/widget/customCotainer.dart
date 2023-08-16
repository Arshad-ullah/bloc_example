import 'package:flutter/material.dart';

import '../../core/components/colors.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {super.key,
      this.onTap,
      this.text,
      this.color,
      this.textColor,
      this.fontSize,
      this.height,
      this.width,
      this.containerColor,
      this.borderColor,
      this.borderwidth,
      this.widget,
      this.borderRadius});

  Function()? onTap;
  String? text;
  Color? color;
  Color? textColor;
  double? fontSize;
  double? height;
  double? width;
  Color? containerColor;
  Color? borderColor;
  double? borderwidth;
  Widget? widget;
  double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
        shadowColor: kblackColor,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 50,
          decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? kwhiteColor, width: borderwidth ?? 0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: containerColor == kwhiteColor
                  ? [
                      kwhiteColor,
                      kwhiteColor,
                    ]
                  : [
                      kgrayColor,
                      kdarkblueColor,
                    ],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(child: widget),
          // child: Center(
          //   child: manropeText(
          //     letterSpacing: 0,
          //     text: text ?? "",
          //     color: textColor ?? kwhiteColor,
          //     fontSize: fontSize ?? 16.sp,
          //     fontWeight: FontWeight.w700,
          //  ),
          //),
        ),
      ),
    );
  }
}
