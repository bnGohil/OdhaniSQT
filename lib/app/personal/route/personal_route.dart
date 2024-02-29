import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/personal/view/edit_personal_details_page.dart';

import '../view/personal_details.dart';

class PersonalRoute{

  static String route = "/personal_details_route";

  static String editPerRoute = "/edit_personal_details_route";

  static Widget child = const PersonalDetails();
  static Widget editChild = const EditPersonalDetailsPage();

  static goToPersonalDetailsPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToEditPersonalDetailsPage(BuildContext context){
    Navigator.pushNamed(context,editPerRoute);
  }

}