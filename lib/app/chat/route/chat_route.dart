import 'package:flutter/material.dart';

import '../view/chat_page.dart';

class ChatRoute{

  static String route = "/chat_route";

  static Widget child = const ChatPage();

  static goToChatPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }


}