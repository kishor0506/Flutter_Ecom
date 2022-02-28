import 'package:ecom/components/custom_surfix_icon.dart';
import 'package:ecom/components/default_button.dart';
import 'package:ecom/components/form_error.dart';
import 'package:ecom/components/no_account_text.dart';
import 'package:ecom/constants.dart';
import 'package:ecom/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getproportionateScreenHeight(20)),
          child: Column(
            children: [
              SizedBox(
                height: sizeconfig.screenHeight * 0.04,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getproportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  "Please enter your email we will send \nyou a link to return your account",
                  textAlign: TextAlign.center),
              SizedBox(
                height: sizeconfig.screenHeight * 0.1,
              ),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formkey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(KEmailNullError)) {
                setState(() {
                  errors.remove(KEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(KInvalidEmailError)) {
                setState(() {
                  errors.remove(KInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(KEmailNullError)) {
                setState(() {
                  errors.add(KEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(KInvalidEmailError)) {
                setState(() {
                  errors.add(KInvalidEmailError);
                });
              }
            },
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(
                  SvgIcon: 'assets/icons/Mail.svg',
                )),
          ),
          SizedBox(
            height: getproportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: sizeconfig.screenHeight * 0.1,
          ),
          DefaultButton(text: "Continue", press: () {}),
          SizedBox(
            height: sizeconfig.screenHeight * 0.1,
          ),
          NoAccountText(),
        ],
      ),
    );
  }
}
