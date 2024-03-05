part of utils;

enum Status { LOADING, COMPLETED, ERROR, UNAUTHORISED }
// enum OrderItemStatus { completed, not_compelted}

enum OrderStatus {
  all(value: "All",apiValue: "all"),
  inProgress(value: "In Progress",apiValue: "in_progress"),
  completed(value: "Completed",apiValue: "completed"),
  pending(value: "Pending",apiValue: "pending"),
  cancel(value: "Canceled",apiValue: "cancelled"),
  delivered(value: "Delivered",apiValue: "delivered"),
  readyForPickup(value: "Ready For Pickup",apiValue: "ready_for_pickup"),
  picked(value: "Picked",apiValue: "picked"),
  rejected(value: "Rejected",apiValue: "rejected"),
  inDelivery(value: "In Delivery",apiValue: "in_delivery");


  const OrderStatus({required this.value,required this.apiValue});

  final String value;
  final String apiValue;

  static OrderStatus? fromSTR({required String? str}) {
    try {
      return OrderStatus.values.firstWhere((element) => element.value == str);
    } catch (e) {
      return null;
    }
  }
}

enum RestaurantType {
  restaurantType(value: "restaurantType"),
  mehkoType(value:"mehko");

  const RestaurantType({required this.value});

  final String value;

  static RestaurantType? fromStr ({required String? str}){
    try {
      return RestaurantType.values.firstWhere((element) => element.value == str);
    } catch (e) {
      return null;
    }
  }

}

enum ApproveType {
  acceptType(value:"accept"),
  pendingType(value:"pending"),
  rejectType(value:"reject");

  const ApproveType({required this.value});

  final String value;

  static ApproveType? fromStr ({required String? str}){
    try {
      return ApproveType.values.firstWhere((element) => element.value == str);
    } catch (e) {
      return null;
    }
  }

}


enum OrderItemStatus {
  completed(value: "completed"),
  notComplete(value: "not_compelted");

  const OrderItemStatus({required this.value});

  final String value;

  static RestaurantType? fromStr ({required String? str}){
    try {
      return RestaurantType.values.firstWhere((element) => element.value == str);
    } catch (e) {
      return null;
    }
  }

}

enum GetTermType {
  cuisinType(value: "restaurant_cuisin_type"),
  resOrderType(value: "restaurant_order_type"),
  resTimeType(value: "time_type"),
  orderStatusType(value: "order_status_type"),
  currencyType(value: "currency_type");

  const GetTermType({required this.value});

  final String value;

  static GetTermType? fromStr ({required String? str}){
    try {
      return GetTermType.values.firstWhere((element) => element.value == str);
    } catch (e) {
      return null;
    }
  }

}


enum MenuType{
  BoutiqueDetail,
  CustomerList,
  AgencyList,
  CompletedOrders,
  Report,
  Query,
  Gallery,
  DeleteAccount,
  Logout
}


enum MenuAgencyType{
  AgencyDetail,
  CompletedOrders,
  BoutiqueList,
  Report,
  Query,
  DeleteAccount,
  Logout
}


enum ScreenType{

  CUSTOMER,AGENCY

}


extension MenuTypeEx on MenuType{

  String? get menuType {
    switch(this){
      case MenuType.BoutiqueDetail:
        return "Boutique Detail";
      case MenuType.CustomerList:
        return "Customer List";
      case MenuType.AgencyList:
        return "Agency List";
      case MenuType.CompletedOrders:
        return "Completed Orders";
      case MenuType.Report:
        return "Reports";
      case MenuType.Query:
        return "Query";
      case MenuType.Gallery:
        return "Gallery";
      case MenuType.DeleteAccount:
        return "Delete Account";
      case MenuType.Logout:
        return "Logout";
    }


  }


}

extension MenuAgencyTypeEx on MenuAgencyType {

  String? get menuAgencyType {
    switch(this){
      case MenuAgencyType.AgencyDetail:
        return "Agency Detail";
      case MenuAgencyType.BoutiqueList:
        return "Boutique List";
      case MenuAgencyType.CompletedOrders:
        return "Completed Orders";
      case MenuAgencyType.Report:
        return "Report";
      case MenuAgencyType.Query:
        return "Query";
      case MenuAgencyType.DeleteAccount:
        return "Delete Account";
      case MenuAgencyType.Logout:
        return "Logout";
    }


  }
}




