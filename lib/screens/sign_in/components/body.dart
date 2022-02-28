import 'package:ecom/components/no_account_text.dart';
import 'package:ecom/components/social_card.dart';
import 'package:ecom/screens/sign_in/components/sign_form.dart';
import 'package:ecom/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getproportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: sizeconfig.screenHeight * 0.04),
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getproportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign with your email and password \n or continue with Social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: sizeconfig.screenHeight * 0.08),
              SignForm(),
              SizedBox(height: sizeconfig.screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: getproportionateScreenHeight(20),
              ),
              NoAccountText()
            ],
          ),
        ),
      ),
    ));
  }
}
