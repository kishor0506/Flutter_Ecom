import 'package:flutter/material.dart';

const KPrimaryColor = Color(0xFFFF7643);
const KPrimaryLightColor = Color(0xFFFFECDF);
const KPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0XFFFFA53E), Color(0xFFFF7643)],
);
const KSecondaryColor = Color(0xFF979797);
const KTextColor = Color(0xFF757575);
const KAnimationDuration = Duration(milliseconds: 200);

//form error

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String KEmailNullError = "Please enter your email";
const String KInvalidEmailError = "Please enter valid email";
const String KPassNullError = "Please enter password";
const String KShortPassError = "Password is too short";
const String KMatchPassError = "Password doen't match";
