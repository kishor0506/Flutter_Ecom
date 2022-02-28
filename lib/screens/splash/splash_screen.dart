import 'package:ecom/screens/splash/components/body.dart';
import 'package:ecom/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    sizeconfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
