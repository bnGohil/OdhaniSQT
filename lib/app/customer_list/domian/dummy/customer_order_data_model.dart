import 'dart:convert';

import 'package:odhani_design_sqt/utils/utils.dart';



class GetCustomerDummyData{

  static GetCustomerData getCustomerData = GetCustomerData(
      name: "Pooja Gajera",
      profilePic: "assets/images/dummy_img/dummy_profile_image.png",
      list: [
        CustomerData(
          item: "Chaniya choli",
          orderDate: DateTime.now().formatCommonDate(),
          completedDate: DateTime.now().formatCommonDate(),
          count: "10000",
          imageList: [
            "assets/images/dummy_img/image_1.png",
            "assets/images/dummy_img/image_2.png"
          ]
        ),
        CustomerData(
          item: "Chaniya choli",
            orderDate: DateTime.now().formatCommonDate(),
            completedDate: DateTime.now().formatCommonDate(),
            count: "10000",
            imageList: [
              "assets/images/dummy_img/image_1.png",
              "assets/images/dummy_img/image_2.png"
            ]
        ),
      ]

  );

  static GetCustomerData getAgencyData = GetCustomerData(
      name: "ABC Agency",
      profilePic: "assets/images/dummy_img/dummy_profile_image.png",
      list: [
        CustomerData(
            item: "Chaniya choli",
            orderDate: DateTime.now().formatCommonDate(),
            completedDate: DateTime.now().formatCommonDate(),
            count: "10000",
            imageList: [
              "assets/images/dummy_img/image_1.png",
              "assets/images/dummy_img/image_2.png"
            ]
        ),
        CustomerData(
            item: "Chaniya choli",
            orderDate: DateTime.now().formatCommonDate(),
            completedDate: DateTime.now().formatCommonDate(),
            count: "10000",
            imageList: [
              "assets/images/dummy_img/image_1.png",
              "assets/images/dummy_img/image_2.png"
            ]
        ),
      ]

  );


}

class GetCustomerData {
  String? name;
  String? profilePic;
  List<CustomerData>? list;

  GetCustomerData({
    this.name,
    this.profilePic,
    this.list,
  });

  
}

class CustomerData {
  String? item;
  String? count;
  String? orderDate;
  String? completedDate;
  List<String>? imageList;

  CustomerData({
    this.item,
    this.count,
    this.orderDate,
    this.completedDate,
    this.imageList,
  });

  
}


