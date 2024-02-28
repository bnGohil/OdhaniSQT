
import 'package:flutter/cupertino.dart';
import 'package:odhani_design_sqt/app/order/view/create_order_screen.dart';
import 'package:odhani_design_sqt/app/tab/view/tab_page.dart';

class OrderRoute{

  static String route = "order_route";
  static String createOrderRoute = "create_order";

  static Widget child = const TabPage();
  static Widget createOrderChild = const CreateOrderScreen();

  static goToTabPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToCreateOrderPage(BuildContext context){
    Navigator.pushNamed(context,createOrderRoute);
  }



}