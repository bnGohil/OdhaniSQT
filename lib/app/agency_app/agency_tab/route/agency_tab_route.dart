import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_tab/view/AgencyTabPage.dart';

class AgencyTabRoute{
  static String route = "agency_tab_route";

  static Widget child = const AgencyTabPage();

  static goToAgeTabPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }


}