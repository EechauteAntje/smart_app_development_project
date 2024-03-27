import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:record_notes/widgets/auth/signIn.dart';
import 'package:record_notes/widgets/auth/signUp.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  Widget selectedWidget = const SignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Record Notes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => {
                  setState(() {
                    selectedWidget = const SignIn();
                  }),
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 144),
              TextButton(
                onPressed: () => {
                  setState(() {
                    selectedWidget = const SignUp();
                  }),
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          selectedWidget,
        ],
      ),
    );
  }
}
