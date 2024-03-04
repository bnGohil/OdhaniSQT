import 'package:flutter/material.dart';
import '../../../../utils/utils.dart';
import '../view/customer_list_page.dart';
import '../view/customer_order_page.dart';

class CustomerRoute{

  static String route = "/customer_list_route";

  static String customerOrderRoute = "/customer_order_route";

  static Widget child = const CustomerListPage();

  static Widget customerOrderChild = const CustomerOrderPage();


  static goToCustomerListPage(BuildContext context,ScreenType? screenType){
    Navigator.pushNamed(context,route,arguments: screenType);
  }

  static goToCustomerOrderPage(BuildContext context,ScreenType? screenType){
    Navigator.pushNamed(context,customerOrderRoute,arguments: screenType);
  }


}