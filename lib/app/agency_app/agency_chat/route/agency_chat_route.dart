import 'package:flutter/material.dart';

import '../view/agency_chat_page.dart';

class AgencyChatRoute{

  static String route = "/agency_chat_route";

  static Widget child = const AgencyChatPage();

  static goToAgencyChatPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }


}