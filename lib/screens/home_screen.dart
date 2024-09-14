// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      appBar: AppBar(
        elevation: 0.0,
        title:
            Text("Task", style: GoogleFonts.rocknRollOne(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.purple.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(),
      ),
    );
  }
}
