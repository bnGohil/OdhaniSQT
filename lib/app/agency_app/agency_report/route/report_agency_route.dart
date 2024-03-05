import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_report/view/age_report_screen.dart';

class ReportAgencyRoute{
  static String route = "/report_agency_route";


  static Widget child = const ReportAgencyScreen();


  static goToReportPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }
}