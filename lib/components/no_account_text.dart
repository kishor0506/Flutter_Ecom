import 'package:ecom/screens/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Dont have an account? ",
          style: TextStyle(fontSize: getproportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: (){},
          child: Text(
            "Sign up",
            style: TextStyle(
                fontSize: getproportionateScreenWidth(16),
                color: KPrimaryColor),
          ),
        ),
      ],
    );
  }
}
