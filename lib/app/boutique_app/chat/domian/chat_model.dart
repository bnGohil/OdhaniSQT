class DummyMessageModel{

  String? msg;
  String? day;
  int? id;

  DummyMessageModel({this.id,this.day,this.msg});

  static List<DummyMessageModel> dummyMsgList = [
    DummyMessageModel(id: 1,day: "02:28 PM",msg: "Lorem ipsum dolor sit ametaliquam feugiat consectetur."),
    DummyMessageModel(id: 2,day: "02:28 PM",msg: "Egestas facilisis integer molestie dignissim tempor etiam odioviverra volutpat."),
    DummyMessageModel(id: 1,day: "02:28 PM",msg: "Lorem ipsum dolor sit amet consectetur. "),
    DummyMessageModel(id: 1,day: "02:28 PM",msg: "Adipiscing id eros nulla vel."),
    DummyMessageModel(id: 2,day: "02:28 PM",msg: "Egestas facilisis integer molestie dignissim tempor etiam odioviverra volutpat."),
    DummyMessageModel(id: 2,day: "02:28 PM",msg: "Lorem ipsum dolor sit amet consectetur. "),
    DummyMessageModel(id: 2,day: "02:28 PM",msg: "Egestas facilisis integer molestie dignissim tempor etiam odioviverra volutpat."),
  ];




}