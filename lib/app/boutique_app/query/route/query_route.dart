import 'package:flutter/cupertino.dart';

import '../view/query_page.dart';

class QueryRoute{

  static String route = "/query_route";

  static Widget child = const QueryPage();

  static goToQueryPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }




}