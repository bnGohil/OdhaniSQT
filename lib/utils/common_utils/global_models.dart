part of utils;



List<String> socialMedialList = ["google","fb","apple"];

List<String> userType = ["Boutique","Agency(Tailor)"];


List<String> materialList = ["Canvas","Cloth","Khakhi","Linin","Cotton","Wool","Leather"];



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