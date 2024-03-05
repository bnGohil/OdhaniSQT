import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_completed_order/view/agency_completed_order_list_screen.dart';

import '../view/agency_completed_order_details.dart';

class CompletedOrderAgencyRoute{
  static String route = "/Completed_order_agency";
  static String completedOrderDetailsRoute = "/Completed_order_details_agency";


  static Widget child = const AgencyCompletedOrderScreen();
  static Widget completedOrderDetailsChild = const CompletedOrderAgencyDetailsScreen();


  static goToCompletedOrderAgencyPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToCompletedOrderDetailsAgencyPage(BuildContext context){
    Navigator.pushNamed(context,completedOrderDetailsRoute);
  }
}