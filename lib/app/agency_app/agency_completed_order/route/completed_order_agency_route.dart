import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_completed_order/view/agency_completed_order_list_screen.dart';

import '../view/agency_completed_order_details.dart';
import '../view/send_req_for_deu_amount_page.dart';

class CompletedOrderAgencyRoute{
  static String route = "/Completed_order_agency";
  static String completedOrderDetailsRoute = "/Completed_order_details_agency";
  static String sendRequestForDeuAmountRoute = "/send_request_for_due_amount_route";


  static Widget child = const AgencyCompletedOrderScreen();

  static Widget completedOrderDetailsChild = const CompletedOrderAgencyDetailsScreen();

  static Widget sendRequestForDeuAmountChild = const SendRequestForDeuAmountPage();




  static goToCompletedOrderAgencyPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToCompletedOrderDetailsAgencyPage(BuildContext context){
    Navigator.pushNamed(context,completedOrderDetailsRoute);
  }

  static goToSendRequestPage(BuildContext context){
    Navigator.pushNamed(context,sendRequestForDeuAmountRoute);
  }
}