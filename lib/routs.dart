import 'package:ecom/screens/forgot_password/forgot_password.dart';
import 'package:ecom/screens/sign_in/sign_in_screen.dart';
import 'package:ecom/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen()
};
