import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/report/view/report_screen.dart';

class ReportRoute{
  static String route = "/report_route";


  static Widget child = const ReportScreen();


  static goToReportPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

}