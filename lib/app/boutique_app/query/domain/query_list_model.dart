class QueryListModel{

   String? fashion;
   String? jobOrderNum;
   String? cName;
   String? product;
   DateTime? dateTime;

  QueryListModel(
      {this.fashion,
      this.jobOrderNum,
      this.cName,
      this.product,
      this.dateTime});


  static List<QueryListModel> queryList = [
    QueryListModel(cName: "Pooja Gajera",dateTime: DateTime.now(),fashion: "Fashion Boutique",jobOrderNum: "245261",product: "Anarkali Kurti"),
    QueryListModel(cName: "Chaniya Choli",dateTime: DateTime.now(),fashion: "Krisha Creativity",jobOrderNum: "245262",product: "Akansha gohel"),
  ];

}