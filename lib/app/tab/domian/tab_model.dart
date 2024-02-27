import 'package:odhani_design_sqt/utils/utils.dart';

class TabModel{

  String? name;
  String? icon;

  TabModel({this.name,this.icon});


 static List<TabModel> tabList = [
   TabModel(name: "Home",icon: "$iconPath/home.svg"),
   TabModel(name: "Order",icon: "$iconPath/order.svg"),
   TabModel(name: "Menu",icon: "$iconPath/menu.svg"),
 ];

}