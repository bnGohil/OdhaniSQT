class JobAndOrderDetailsModel{

  String? text;
  bool? isBool;

  JobAndOrderDetailsModel({this.text,this.isBool});

  static List<JobAndOrderDetailsModel> list = [
    JobAndOrderDetailsModel(text: "Order Detail",isBool: false),
    JobAndOrderDetailsModel(text: "Job Detail",isBool: false),
  ];



}