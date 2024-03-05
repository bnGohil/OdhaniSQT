import 'package:flutter/material.dart';
import '../view/agency_profile_screen.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_profile/view/agency_edit_profile_screen.dart';

class ProfileAgencyRoute {
  static String route = "/profile_agency_route";
  static String editRoute = "/agency_edit_profile_route";

  static Widget child = const AgencyProfileScreen();
  static Widget editChild = const AgencyEditProfileScreen();

  static goToProfilePage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToEditProfile(BuildContext context){
    Navigator.pushNamed(context,editRoute);
  }
}