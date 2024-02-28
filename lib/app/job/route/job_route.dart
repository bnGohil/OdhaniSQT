import 'package:flutter/cupertino.dart';
import 'package:odhani_design_sqt/app/job/view/job_detail_page.dart';

class JobRoute{

  static String route = "job_route";

  static Widget child = const JobDetailsPage();

  static goToJobDetailsPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

}