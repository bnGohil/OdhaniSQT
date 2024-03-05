import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_details/view/personal_agency_details.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_details/view/personal_edit_agency_details.dart';

class PersonalAgencyRoute{
  static String route = "/personal_agency_details_route";

  static String editPerRoute = "/edit_personal_agency_details_route";

  static Widget child = const PersonalAgencyDetails();
  static Widget editChild = const PersonalEditAgencyDetails();

  static goToPersonalDetailsPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToEditPersonalDetailsPage(BuildContext context){
    Navigator.pushNamed(context,editPerRoute);
  }
}