import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getproportionateScreenHeight(56),
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: KPrimaryColor,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              fontSize: getproportionateScreenWidth(18),
              color: Colors.white,
            ),
          )),
    );
  }
}
