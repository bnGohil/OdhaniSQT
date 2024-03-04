import 'package:flutter/material.dart';

class AgencyOrderPage extends StatefulWidget {
  const AgencyOrderPage({super.key});

  @override
  State<AgencyOrderPage> createState() => _AgencyOrderPageState();
}

class _AgencyOrderPageState extends State<AgencyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Agency Order Page")
        ],
      ),
    );
  }
}
