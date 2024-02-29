
import 'package:flutter/cupertino.dart';
import 'package:odhani_design_sqt/app/order/view/create_order/create_order_screen.dart';
import 'package:odhani_design_sqt/app/order/view/completed_order_page.dart';
import 'package:odhani_design_sqt/app/order/view/create_order/create_sub_order_details.dart';
import 'package:odhani_design_sqt/app/tab/view/tab_page.dart';
import '../view/order_details_page.dart';

class OrderRoute{

  static String route = "order_route";

  static String createOrderRoute = "create_order";
  static String createSubOrderDetailsRoute = "create_order_sub_order";

  static String orderDetailRoute = "/order_details_route";

  static String orderCompletedRoute = "/order_order_route";

  static Widget child = const OrderDetailsPage();

  static Widget createOrderChild = const CreateOrderScreen();

  static Widget createSubOrderDetailsChild = const CreateSubOrderDetails();

  static Widget completedChild = const CompletedOrderPage();

  static goToOrderDetailsPage(BuildContext context){
    Navigator.pushNamed(context,orderDetailRoute);
  }

  static goToCreateOrderPage(BuildContext context){
    Navigator.pushNamed(context,createOrderRoute);
  }

  static goToCreateSubOrderDetails(BuildContext context){
    Navigator.pushNamed(context,createSubOrderDetailsRoute);
  }

  static goToCompletedOrder(BuildContext context){
    Navigator.pushNamed(context,orderCompletedRoute);
  }

  

  


}