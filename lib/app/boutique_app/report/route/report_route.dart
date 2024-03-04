import 'package:flutter/material.dart';

import '../view/report_screen.dart';

class ReportRoute{
  static String route = "/report_route";


  static Widget child = const ReportScreen();


  static goToReportPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

}