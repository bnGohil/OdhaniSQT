import 'package:flutter/cupertino.dart';
import 'package:odhani_design_sqt/app/tab/view/tab_page.dart';

class TabRoute{

  static String route = "tab_route";

  static Widget child = const TabPage();

  static goToTabPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }


}