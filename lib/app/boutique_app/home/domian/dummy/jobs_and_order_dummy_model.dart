import '../../../../../utils/sizer/enum.dart';

class JobsAndOrderDummyModel{
  TypesOfApp? typesOfApp;
  String? profilePic;
  String? location;
  String? title;
  int? count;
  JobStatus? jobStatus;
  List<String>? ordersValue;
  List<String>? ordersImages;
  DateTime? orderDate;
  DateTime? dueDate;

  JobsAndOrderDummyModel({this.profilePic,this.orderDate,this.dueDate,this.location,this.ordersImages,
    this.typesOfApp,
    this.jobStatus,
  this.ordersValue,this.title,this.count});


  static List<JobsAndOrderDummyModel> jobsListData = [
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
  ];

  static List<JobsAndOrderDummyModel> jobAcceptsListData = [
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",
        dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.ACCEPT,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.ACCEPT,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.ACCEPT,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.ACCEPT,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",count: 500,dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.ACCEPT,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
  ];




  static List<JobsAndOrderDummyModel> orderListData = [
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        typesOfApp: TypesOfApp.BOUTIQUE,
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
  ];


  static List<JobsAndOrderDummyModel> jobAgencyPendingListData = [
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.PENDING,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.PENDING,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.PENDING,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.PENDING,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.PENDING,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
  ];


  static List<JobsAndOrderDummyModel> jobAgencyRejectListData = [
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.REJECT,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.REJECT,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.REJECT,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.REJECT,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
    JobsAndOrderDummyModel(profilePic: "assets/images/dummy_img/dummy_profile_image.png",title: "Fashion Agency ",dueDate: DateTime.now(),
        location: "34, shyam Enclave, Opp madhav FarmAhmedabad Gujrat 382330",orderDate: DateTime.now(),
        ordersImages: ["assets/images/dummy_img/image_1.png","assets/images/dummy_img/image_2.png"],
        typesOfApp: TypesOfApp.AGENCY,
        jobStatus: JobStatus.REJECT,
        ordersValue:
        ["Anarkali Kurti","Blouse"]
    ),
  ];



}