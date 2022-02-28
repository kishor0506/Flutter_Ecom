import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class splashcontent extends StatelessWidget {
  const splashcontent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "TOKOTO",
          style: TextStyle(
              fontSize: getproportionateScreenWidth(36),
              color: KPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(text),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getproportionateScreenHeight(256),
          width: getproportionateScreenWidth(235),
        )
      ],
    );
  }
}
