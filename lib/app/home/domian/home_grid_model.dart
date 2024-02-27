
class HomeInfoCardModel {
  final String? cardNumber;
  final String? cardText;

  HomeInfoCardModel({this.cardNumber, this.cardText});


  static List<HomeInfoCardModel> gridList = [
    HomeInfoCardModel(cardNumber: "15",cardText: "Total Orders"),
    HomeInfoCardModel(cardNumber: "07",cardText: "Today's Orders"),
    HomeInfoCardModel(cardNumber: "₹1,000" ,cardText: "Total Earnings"),
    HomeInfoCardModel(cardNumber: "2",cardText: "Completed Orders"),
  ];

}

