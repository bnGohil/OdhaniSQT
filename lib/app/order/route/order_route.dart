
import 'package:flutter/cupertino.dart';
import 'package:odhani_design_sqt/app/order/view/create_order_screen.dart';
import 'package:odhani_design_sqt/app/order/view/completed_order_page.dart';
import 'package:odhani_design_sqt/app/tab/view/tab_page.dart';
import '../view/order_details_page.dart';

class OrderRoute{

  static String route = "order_route";
  static String createOrderRoute = "create_order";



  static Widget createOrderChild = const CreateOrderScreen();

  static String orderDetailRoute = "/order_details_route";

  static String orderCompletedRoute = "/order_order_route";

  static Widget child = const OrderDetailsPage();


  static Widget completedChild = const CompletedOrderPage();

  static goToOrderDetailsPage(BuildContext context){
    Navigator.pushNamed(context,orderDetailRoute);
  }

  static goToCreateOrderPage(BuildContext context){
    Navigator.pushNamed(context,createOrderRoute);
  }



  static goToCompletedOrder(BuildContext context){
    Navigator.pushNamed(context,orderCompletedRoute);
  }

  

  


}