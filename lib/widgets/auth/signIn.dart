import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:record_notes/routes/recordNote/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    super.key,
  });

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';

  void login() async {
    if (email.isNotEmpty && password.isNotEmpty) {
      print('Email: $email, Password: $password');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (credential.user != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          );
        }
        // Navigate to DocumentsView
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xffffffff).withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 31, left: 15, right: 15),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5), // Rounded edges
                ),
              ),
              style: const TextStyle(
                height: 1,
              ),
              onChanged: (value) => email = value,

              //set default
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5), // Rounded edges
                ),
              ),
              style: const TextStyle(
                height: 1,
                color: Colors.black,
              ),
              onChanged: (value) => password = value,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 18),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: login,
                child: const Text('Sign In',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text(
              'Forgot password?',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
