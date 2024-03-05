import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_boutique_list/view/boutique_agency_details.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_boutique_list/view/boutique_agency_list.dart';

class BoutiqueListRoute{
  static String route = "/boutique_list_route";

  static String boutiqueAgencyDetailsRoute = "/boutique_list_details_route";

  static Widget child = const BoutiqueAgencyList();

  static Widget boutiqueAgencyDetailsChild = const BoutiqueAgencyDetailsView();


  static goToCustomerListPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToBoutiqueAgencyDetailsPage(BuildContext context){
    Navigator.pushNamed(context,boutiqueAgencyDetailsRoute);
  }

}