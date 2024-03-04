import 'package:flutter/cupertino.dart';

import '../view/create_job/create_job_order_screen.dart';
import '../view/create_job/sub_job_order_details.dart';
import '../view/job_detail_page.dart';

class JobRoute{

  static String route = "job_route";
  static String createJobRoute = "create_job_route";

  static String subJobOrderDetailsJobRoute = "sub_job_order_route";

  static Widget child = const JobDetailsPage();

  static Widget subJobDetailsOrderChild = const SubJobOrderDetails();

  static Widget createJobChild = const CreateJobOrderScreen();

  static goToJobDetailsPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }

  static goToCreateJobPage(BuildContext context){
    Navigator.pushNamed(context,createJobRoute);
  }

  static goToSubJobOrderDetailPage(BuildContext context){
    Navigator.pushNamed(context,subJobOrderDetailsJobRoute);
  }

}