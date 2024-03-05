class CustomerListDataModel{

  String? profilePic;
  String? location;
  String? name;
  CustomerListDataModel({this.profilePic, this.location, this.name});

  static List<CustomerListDataModel> customerList = [
    CustomerListDataModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",name: "Pooja Gajera",location: "27, Via Domenico Maria Manni Naroda,Ahmedabad - 382330"),
    CustomerListDataModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",name: "Akansha Gohel",location: "27, Via Domenico Maria Manni Naroda,Ahmedabad - 382330"),
  ];

  static List<CustomerListDataModel>  agencyList = [
    CustomerListDataModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",name: "Abc Agency",location: "27, Via Domenico Maria Manni Naroda,Ahmedabad - 382330"),
    CustomerListDataModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",name: "Acd Agency",location: "27, Via Domenico Maria Manni Naroda,Ahmedabad - 382330"),
  ];



  static List<CustomerListDataModel> boutiqueDummyList = [
    CustomerListDataModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",name: "Odhani Boutique",location: "27, Via Domenico Maria Manni Naroda,Ahmedabad - 382330"),
    CustomerListDataModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",name: "Kisha Boutique",location: "27, Via Domenico Maria Manni Naroda,Ahmedabad - 382330"),
  ];








}