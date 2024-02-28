import 'package:flutter/cupertino.dart';

import '../../notification/view/notification_page.dart';

class JobRoute{

  static String route = "/job_details_route";

  static Widget child = const NotificationPage();

  static goToNotification(BuildContext context){
    Navigator.pushNamed(context,route);
  }

}