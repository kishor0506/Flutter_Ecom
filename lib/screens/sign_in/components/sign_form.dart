import 'package:ecom/components/custom_surfix_icon.dart';
import 'package:ecom/components/default_button.dart';
import 'package:ecom/components/form_error.dart';
import 'package:ecom/screens/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formkey = GlobalKey<FormState>();
  late String email;
  late String password;
  late bool remember = false;

  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(
              height: getproportionateScreenHeight(30),
            ),
            buildPasswordFormField(),
            SizedBox(
              height: getproportionateScreenHeight(30),
            ),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    activeColor: KPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            FormError(errors: errors),
            SizedBox(
              height: getproportionateScreenHeight(20),
            ),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                  }
                })
          ],
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(KPassNullError)) {
          setState(() {
            errors.remove(KPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(KShortPassError)) {
          setState(() {
            errors.remove(KShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(KPassNullError)) {
          setState(() {
            errors.add(KPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(KShortPassError)) {
          setState(() {
            errors.add(KShortPassError);
          });
        }
      },
      decoration: InputDecoration(
          labelText: "password",
          hintText: "Enter your Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            SvgIcon: 'assets/icons/Lock.svg',
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
    );
  }
}
