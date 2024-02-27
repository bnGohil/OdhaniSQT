import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/tab/domian/tab_model.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Center(
        child: Text("Menu"),
      ),

    );
  }
}
