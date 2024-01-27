import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/pages/forget_password.dart';
import 'package:learningapp/pages/onboarding_page.dart';
import 'package:learningapp/pages/signup_page.dart';
import 'package:learningapp/widgets/login_signup_widgets/sign_in_up_button.dart';
import 'package:learningapp/widgets/toast.dart';

import '../user_authentication/firebase_auth_services.dart';
import '../widgets/login_signup_widgets/textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log In",
                style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).primaryColor
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextForm(
                isPassword: false,
                labelText: "Email",
                controller: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextForm(
                isPassword: true,
                labelText: "Password",
                controller: _passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()));
                      },
                      child: const Text("Forgot Password"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SignButton(
                text: "Log In",
                onPressed: _signIn,
                isSigning: isSigning,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully logged in");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OnboardingPage()));
    } else {
      showToast(message: "Something went wrong");
    }
  }
}
