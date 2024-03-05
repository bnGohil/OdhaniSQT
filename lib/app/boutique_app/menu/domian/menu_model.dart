import 'package:odhani_design_sqt/utils/utils.dart';

class MenuModel{
  MenuType? menuType;
  MenuModel({this.menuType});

  static List<MenuModel> menuList = [
    MenuModel(menuType: MenuType.BoutiqueDetail),
    MenuModel(menuType: MenuType.CustomerList),
    MenuModel(menuType: MenuType.AgencyList),
    MenuModel(menuType: MenuType.CompletedOrders),
    MenuModel(menuType: MenuType.Report),
    MenuModel(menuType: MenuType.Query),
    MenuModel(menuType: MenuType.Gallery),
    MenuModel(menuType: MenuType.DeleteAccount),
    MenuModel(menuType: MenuType.Logout),
  ];

}

class AgencyMenuModel {
  MenuAgencyType? menuAgencyType;
  AgencyMenuModel({this.menuAgencyType});

  static List<AgencyMenuModel> menuAgencyList = [
    AgencyMenuModel(menuAgencyType: MenuAgencyType.AgencyDetail),
    AgencyMenuModel(menuAgencyType: MenuAgencyType.CompletedOrders),
    AgencyMenuModel(menuAgencyType: MenuAgencyType.BoutiqueList),
    AgencyMenuModel(menuAgencyType: MenuAgencyType.Report),
    AgencyMenuModel(menuAgencyType: MenuAgencyType.Query),
    AgencyMenuModel(menuAgencyType: MenuAgencyType.DeleteAccount),
    AgencyMenuModel(menuAgencyType: MenuAgencyType.Logout),
  ];
}