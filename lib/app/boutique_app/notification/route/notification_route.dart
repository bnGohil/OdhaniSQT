import 'package:flutter/material.dart';

import '../view/notification_page.dart';

class NotificationRoute{

  static String route = "/notification_route";

  static Widget child = const NotificationPage();

  static goToNotification(BuildContext context){
    Navigator.pushNamed(context,route);
  }

}