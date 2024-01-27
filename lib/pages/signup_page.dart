import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/pages/login_page.dart';
import 'package:learningapp/user_authentication/firebase_auth_services.dart';
import 'package:learningapp/widgets/toast.dart';

import '../widgets/login_signup_widgets/sign_in_up_button.dart';
import '../widgets/login_signup_widgets/textformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
              Text("Sign Up", style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColor
              )),
              const SizedBox(
                height: 20,
              ),
              TextForm(
                isPassword: false,
                labelText: "Username",
                controller: _usernameController,
              ),
              const SizedBox(
                height: 20,
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
                height: 40,
              ),
              SignButton(text: "Sign Up",onPressed: _signUp,isSigning: isSigning,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text("Log In"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    setState(() {
      isSigning = false;
    });

    if(user != null){
      showToast(message: "User is successfully created");
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
    else{
    }
  }

}