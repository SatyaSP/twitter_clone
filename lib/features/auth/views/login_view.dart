import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/views/signup_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallete.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(
      builder: (context)=> const LoginView()
  );
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body : Center(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                  AuthField(controller: emailController, hintText: 'Email',),
                  const SizedBox(height: 20.0,),
                  AuthField(controller: passwordController, hintText: 'Password',),
                  const SizedBox(height: 20.0,),
                  Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                        onTap: (){},
                        label: 'Done',
                        backgroundColor: Pallete.whiteColor,
                        textColor: Pallete.backgroundColor,),
                  ),
                const SizedBox(height: 20.0,),
                RichText(text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: Pallete.blueColor,
                        fontSize: 16
                      ),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.push(context,
                            SignUpView.route());

                      }
                    )
                  ]
                ))
              ],

            ),
          ),
        ),
      )
    );
  }
}


