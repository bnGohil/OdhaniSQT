import 'package:odhani_design_sqt/utils/utils.dart';

class MenuModel{

  String? name;

  MenuModel({this.name});


 static List<MenuModel> menuList = [
   MenuModel(name: "Boutique Detail"),
   MenuModel(name: "Customer List"),
   MenuModel(name: "Agency List"),
   MenuModel(name: "Completed Orders"),
   MenuModel(name: "Reports"),
   MenuModel(name: "Query"),
   MenuModel(name: "Gallery"),
   MenuModel(name: "Delete Account"),
   MenuModel(name: "Logout"),
 ];

}