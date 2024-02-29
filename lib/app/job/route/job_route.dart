import 'package:flutter/cupertino.dart';
import 'package:odhani_design_sqt/app/job/view/create_job_order_screen.dart';
import 'package:odhani_design_sqt/app/job/view/job_detail_page.dart';

class JobRoute{

  static String route = "job_route";
  static String createJobRoute = "create_job_route";

  static Widget child = const JobDetailsPage();
  static Widget createJobChild = const CreateJobOrderScreen();

  static goToJobDetailsPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToCreateJobPage(BuildContext context){
    Navigator.pushNamed(context,createJobRoute);
  }

}