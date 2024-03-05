import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_query/view/query_agency_screen.dart';

class QueryAgencyRoute{
  static String route = "/query_Agency_route";

  static Widget child = const QueryAgencyScreen();

  static goToQueryPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }



}