part of utils;



List<String> socialMedialList = ["google","fb","apple"];

List<String> userType = ["Boutique","Agency(Tailor)"];


List<String> materialList = ["Canvas","Cloth","Khakhi","Linin","Cotton","Wool","Leather"];

List<String> reportTabList = ["Daily" , "Weekly" , "Monthly"];



class CustomOrderDetailsModel {
   DateTime? orderDate;
   DateTime? deliveryDate;
  final FocusNode? productFN;
  final TextEditingController? productController;
  final FocusNode? productQuantityFN;
  final TextEditingController? productQuantityController;
  final List<CustomAttributesModel>? attributesList;
  final FocusNode? priceFN;
  final TextEditingController? priceController;
  final FocusNode? advicePayFN;
  final TextEditingController? advicePayController;
  final FocusNode? descriptionFN;
  final TextEditingController? descriptionController;
  final List<File>? imageFileList = [];
  final List<AssetModel>? imageList;

  CustomOrderDetailsModel({this.orderDate, this.deliveryDate, this.productFN, this.productController, this.productQuantityFN, this.productQuantityController, this.attributesList, this.priceFN, this.priceController, this.advicePayFN, this.advicePayController, this.descriptionFN, this.descriptionController, this.imageList});
}

class CustomAttributesModel{
  String? attName;
  FocusNode? attributeFN;
  TextEditingController? attributeController;
}

class CustomJobDetailsModel {
  DateTime? jobOrderDate;
  DateTime? jobDeliveryDate;
  final FocusNode? agencyNameFN;
  final TextEditingController? agencyNameController;
  final FocusNode? productQuantityFN;
  final TextEditingController? productQuantityController;
  final List<CustomAttributesModel>? attributesList;
  final FocusNode? priceFN;
  final TextEditingController? priceController;
  final FocusNode? descriptionFN;
  final TextEditingController? descriptionController;
  final List<File>? imageFileList = [];
  final List<AssetModel>? imageList;

  CustomJobDetailsModel(
      {this.agencyNameFN, this.agencyNameController, this.productQuantityFN, this.productQuantityController, this.attributesList, this.priceFN, this.priceController, this.descriptionFN, this.descriptionController, this.imageList});

}

class ReportCardModel {
  final String? cName;
  final String? pName;
  final String? orderValue;
  final String? orderCompletion;
  ReportCardModel(
      {this.cName, this.pName, this.orderValue, this.orderCompletion});
}

List<ReportCardModel> reportCardList = [

  ReportCardModel(
    cName: "Pooja Gajera",
    pName: "Anarkali Kurti",
    orderValue:"₹30",
    orderCompletion: "2/10/2024"
  ),

  ReportCardModel(
    cName: "Pooja Gajera",
    pName: "Anarkali Kurti",
    orderValue:"₹30",
    orderCompletion: "2/10/2024"
  ),
  ReportCardModel(
    cName: "Pooja Gajera",
    pName: "Anarkali Kurti",
    orderValue:"₹30",
    orderCompletion: "2/10/2024"
  ),

];