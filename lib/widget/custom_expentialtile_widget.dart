import 'package:flutter/material.dart';

import '../core/components/fontmanager.dart';

class CustomExpentialTile extends StatelessWidget {
  String? title;
  String? text;
  CustomExpentialTile({Key? key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(25.0),
      shadowColor: Colors.black,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: manropeText(
              text: title ?? "Dummy",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.5),
              letterSpacing: 0),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black.withOpacity(0.5),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: manropeText(
                  text: text ?? "Dummy",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.5),
                  letterSpacing: 0),
            ),
          ],
        ),
      ),
    );
  }
}
