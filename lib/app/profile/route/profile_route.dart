import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/profile/view/edit_profile_page.dart';
import 'package:odhani_design_sqt/app/profile/view/profile_page.dart';

class ProfileRoute{
  static String route = "/profile_route";
  static String editRoute = "/edit_profile_route";

  static Widget child = const ProfilePage();
  static Widget editChild = const EditProfilePage();

  static goToProfilePage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToEditProfile(BuildContext context){
    Navigator.pushNamed(context,editRoute);
  }
}