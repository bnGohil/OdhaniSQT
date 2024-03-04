import 'package:flutter/material.dart';

class AgencyHomePage extends StatefulWidget {
  const AgencyHomePage({super.key});

  @override
  State<AgencyHomePage> createState() => _AgencyHomePageState();
}

class _AgencyHomePageState extends State<AgencyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Agency Home Page")
        ],
      ),
    );
  }
}
