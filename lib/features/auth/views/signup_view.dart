import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/views/login_view.dart';
import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../../../theme/pallete.dart';
import '../widgets/auth_field.dart';


class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
      builder: (context)=> const SignUpView()
  );
  const SignUpView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp() {
    final res = ref.read(authControllerProvider.notifier).signUp(
        email: emailController.text,
        password: passwordController.text,
        context: context
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar,
        body : Center(
          child: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  AuthField(controller: emailController, hintText: 'Email',),
                  const SizedBox(height: 20.0,),
                  AuthField(controller: passwordController, hintText: 'Password',),
                  const SizedBox(height: 20.0,),
                  Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                      onTap: onSignUp,
                      label: 'Done',
                      backgroundColor: Pallete.whiteColor,
                      textColor: Pallete.backgroundColor,),
                  ),
                  const SizedBox(height: 20.0,),
                  RichText(text: TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                            text: 'Log in',
                            style: const TextStyle(
                                color: Pallete.blueColor,
                                fontSize: 16
                            ),
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Navigator.push(context,
                                  LoginView.route()
                              );
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
