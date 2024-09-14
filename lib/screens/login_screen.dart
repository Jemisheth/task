// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task/auth/auth_service.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final auth = AuthService();

  _logIn() async {
    final userLogin = await auth.signInWithEmailAndPassword(
        emailController.text, passController.text);
    if (userLogin != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                    children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.aBeeZee(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            labelText: 'Enter email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          controller: passController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.security),
                            labelText: 'Enter password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: _logIn,
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: const Text("Create Account"))
                      ],
                    ),
                  ),
                ],
              ),
            ),
                    ],
                  ),
          )),
    );
  }
}
