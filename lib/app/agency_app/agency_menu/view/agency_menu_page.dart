import 'package:flutter/material.dart';

class AgencyMenuPage extends StatefulWidget {
  const AgencyMenuPage({super.key});

  @override
  State<AgencyMenuPage> createState() => _AgencyMenuPageState();
}

class _AgencyMenuPageState extends State<AgencyMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Agency Menu Page")
        ],
      ),
    );
  }
}
