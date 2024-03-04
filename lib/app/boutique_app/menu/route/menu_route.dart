import 'package:flutter/cupertino.dart';

import '../../tab/view/tab_page.dart';

class MenuRoute{

  static String route = "menu_route";

  static Widget child = const TabPage();

  static goToTabPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }


}