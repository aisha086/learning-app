import 'package:flutter/material.dart';

import '../user_authentication/firebase_auth_services.dart';
import '../widgets/login_signup_widgets/sign_in_up_button.dart';
import '../widgets/login_signup_widgets/textformfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  bool isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Reset Password",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20,),
                TextForm(isPassword: false,labelText: "Email",controller: _emailController,),
                const SizedBox(height: 20,),
                SignButton(text: "Reset Password",onPressed: _resetPassword,isSigning: isSigning,),
              ],
            ),
          ),
        ),
    );
  }

  void _resetPassword() async {
    setState(() {
      isSigning = true;
    });
    String email = _emailController.text;

    await _auth.resetPassword(email, context);

    setState(() {
      isSigning = false;
    });

  }
}
