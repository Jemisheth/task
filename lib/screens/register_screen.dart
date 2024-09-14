import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/auth_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final auth = AuthService();

  signIn() async {
    final user = await auth.createUserWithEmailAndPassword(
        emailController.text, passController.text);
    if (user != null) {
      await auth.sendVerifyEmail();

      bool isverified = false;
      while (!isverified) {
        await Future.delayed(const Duration(seconds: 5));
        isverified = await auth.isEmailVerified();
        if (isverified) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      }
    }
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text('Sign Up', style: GoogleFonts.aBeeZee(fontSize: 20)),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            labelText: 'Enter name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
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
                            // You can add more complex email validation here if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: passController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.security),
                            labelText: 'Enter password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: signIn,
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
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
